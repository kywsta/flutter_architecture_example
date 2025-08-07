import 'package:flutter/material.dart';
import 'package:flutter_architecture_example/mvvm/models/product.dart';
import 'package:flutter_architecture_example/mvvm/services/product_service.dart';

class ProductListViewModel extends ChangeNotifier {
  final ProductService _productService;

  ProductListViewModel({required ProductService productService})
    : _productService = productService;

  List<Product> _products = [];
  bool _isLoading = false;
  String? _error;

  List<Product> get products => _products;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void loadProducts() async {
    _setLoading(true);
    _setError(null);

    try {
      _products = await _productService.getProducts();
      notifyListeners();
    } catch (e, s) {
      debugPrint("$e $s");
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String? value) {
    _error = value;
    notifyListeners();
  }
}
