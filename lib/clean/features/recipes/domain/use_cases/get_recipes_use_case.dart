import 'package:flutter_architecture_example/clean/features/recipes/domain/entities/recipe.dart';
import 'package:flutter_architecture_example/clean/features/recipes/domain/repositories/recipe_repository.dart';

class GerRecipesUseCase {
  final RecipeRepository recipeRepository;

  GerRecipesUseCase(this.recipeRepository);

  Future<List<Recipe>> call() async {
    return await recipeRepository.getRecipes();
  }
}
