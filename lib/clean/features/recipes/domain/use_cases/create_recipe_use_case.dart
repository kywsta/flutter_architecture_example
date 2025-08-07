import 'package:flutter_architecture_example/clean/features/recipes/domain/entities/recipe.dart';
import 'package:flutter_architecture_example/clean/features/recipes/domain/repositories/recipe_repository.dart';

class CreateRecipeUseCase {
  final RecipeRepository recipeRepository;

  CreateRecipeUseCase(this.recipeRepository);

  Future<Recipe> call(Recipe recipe) async {
    if (recipe.name.isEmpty || recipe.ingredients.isEmpty || recipe.instructions.isEmpty) {
      throw 'Recipe should have a name, ingredients, and instructions';
    }

    return await recipeRepository.createRecipe(recipe);
  }
}
