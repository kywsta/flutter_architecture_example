import 'dart:convert';

import 'package:flutter_architecture_example/clean/features/recipes/domain/entities/new_recipe.dart';
import 'package:flutter_architecture_example/clean/features/recipes/domain/entities/recipe.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'https://dummyjson.com';

abstract class RecipeRemoteDataSource {
  Future<List<Recipe>> getRecipes();
  Future<Recipe> getRecipeById(int id);
  Future<Recipe> createRecipe(NewRecipe recipe);
  Future<Recipe> updateRecipe(Recipe recipe);
  Future<void> deleteRecipe(int id);
}

class RecipeRemoteDataSourceImpl implements RecipeRemoteDataSource {
  final http.Client _client;

  RecipeRemoteDataSourceImpl({required http.Client client}) : _client = client;

  @override
  Future<Recipe> createRecipe(NewRecipe recipe) async {
    final response = await _client.post(
      Uri.parse('$baseUrl/recipes'),
      body: jsonEncode(recipe.toJson()),
    );
    if (response.statusCode == 201) {
      return Recipe.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create Recipe: ${response.statusCode}');
    }
  }

  @override
  Future<void> deleteRecipe(int id) async {
    final response = await _client.delete(Uri.parse('$baseUrl/recipes/$id'));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete Recipe: ${response.statusCode}');
    }
  }

  @override
  Future<Recipe> getRecipeById(int id) async {
    final response = await _client.get(Uri.parse('$baseUrl/recipes/$id'));
    if (response.statusCode == 200) {
      return Recipe.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get Recipe: ${response.statusCode}');
    }
  }

  @override
  Future<List<Recipe>> getRecipes() async {
    final response = await _client.get(Uri.parse('$baseUrl/recipes'));
    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      return (body['recipes'] as List)
          .map((e) => Recipe.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to get Recipes: ${response.statusCode}');
    }
  }

  @override
  Future<Recipe> updateRecipe(Recipe recipe) async {
    final response = await _client.put(
      Uri.parse('$baseUrl/recipes/${recipe.id}'),
      body: jsonEncode(recipe.toJson()),
    );
    if (response.statusCode == 200) {
      return Recipe.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update Recipe: ${response.statusCode}');
    }
  }
}
