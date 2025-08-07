import 'package:flutter_architecture_example/clean/features/recipes/data/data_sources/recipe_remote_data_source.dart';
import 'package:flutter_architecture_example/clean/features/recipes/domain/entities/recipe.dart';
import 'package:flutter_architecture_example/clean/features/recipes/domain/repositories/recipe_repository.dart';

class RecipeRepositoryImpl extends RecipeRepository {
  final RecipeRemoteDataSource remoteDataSource;

  RecipeRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Recipe> getRecipeById(int id) async {
    return await remoteDataSource.getRecipeById(id);
  }

  @override 
  Future<List<Recipe>> getRecipes() async {
    return await remoteDataSource.getRecipes();
  }

  @override
  Future<Recipe> createRecipe(Recipe recipe) async {
    return await remoteDataSource.createRecipe(recipe);
  }

  @override
  Future<Recipe> updateRecipe(Recipe recipe) async {
    return await remoteDataSource.updateRecipe(recipe);
  }

  @override
  Future<void> deleteRecipe(int id) async {
    await remoteDataSource.deleteRecipe(id);
  }
}
