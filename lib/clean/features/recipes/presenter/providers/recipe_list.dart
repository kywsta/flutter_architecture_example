import 'package:flutter/material.dart';
import 'package:flutter_architecture_example/clean/features/recipes/domain/entities/recipe.dart';
import 'package:flutter_architecture_example/clean/features/recipes/domain/use_cases/get_posts_use_case.dart';

class RecipeList extends ChangeNotifier {
  final GerRecipesUseCase getRecipesUseCase;

  RecipeList({required this.getRecipesUseCase});

  List<Recipe> _recipes = [];
  bool _isLoading = false;
  String? _error;

  List<Recipe> get recipes => _recipes;
  bool get isLoading => _isLoading;
  String? get error => _error;

  void loadRecipes() async {
    _setLoading(true);
    _setError(null);

    try {
      _recipes = await getRecipesUseCase.call();
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
