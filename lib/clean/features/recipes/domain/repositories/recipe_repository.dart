import 'package:flutter_architecture_example/clean/features/recipes/domain/entities/new_recipe.dart';
import 'package:flutter_architecture_example/clean/features/recipes/domain/entities/recipe.dart';

abstract class RecipeRepository {
  Future<List<Recipe>> getRecipes();
  Future<Recipe> getRecipeById(int id);
  Future<Recipe> createRecipe(NewRecipe recipe);
  Future<Recipe> updateRecipe(Recipe recipe);
  Future<void> deleteRecipe(int id);
}
