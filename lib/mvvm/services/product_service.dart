import 'dart:convert';

import 'package:flutter_architecture_example/mvvm/models/product.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<Product> getProduct(String id) async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products/$id'),
    );
    if (response.statusCode == 200) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load product: ${response.statusCode}');
    }
  }

  Future<List<Product>> getProducts() async {
    final response = await http.get(
      Uri.parse('https://fakestoreapi.com/products'),
    );
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return (body as List).map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load products: ${response.statusCode}');
    }
  }

  Future<Product> createProduct(Product product) async {
    final response = await http.post(
      Uri.parse('https://fakestoreapi.com/products'),
      body: jsonEncode(product.toJson()),
    );
    if (response.statusCode == 201) {
      return Product.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create product: ${response.statusCode}');
    }
  }
}
