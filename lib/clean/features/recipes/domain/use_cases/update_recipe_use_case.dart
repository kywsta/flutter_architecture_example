import 'package:flutter_architecture_example/clean/features/recipes/domain/entities/recipe.dart';
import 'package:flutter_architecture_example/clean/features/recipes/domain/repositories/recipe_repository.dart';

class UpdateRecipeUseCase {
  final RecipeRepository postRepository;

  UpdateRecipeUseCase(this.postRepository);

  Future<Recipe> call(Recipe recipe) async {
    if (recipe.id <= 0) {
      throw 'Invalid recipe ID';
    }

    if (recipe.name.isEmpty || recipe.ingredients.isEmpty || recipe.instructions.isEmpty) {
      throw 'Recipe should have a name, ingredients, and instructions';
    }

    return await postRepository.updateRecipe(recipe);
  }
}
