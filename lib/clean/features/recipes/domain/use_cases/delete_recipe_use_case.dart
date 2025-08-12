import 'package:flutter_architecture_example/clean/features/recipes/domain/repositories/recipe_repository.dart';

class DeleteRecipeUseCase {
  final RecipeRepository recipeRepository;

  DeleteRecipeUseCase(this.recipeRepository);

  Future<void> call(int id) async {
    if (id <= 0) {
      throw 'Invalid recipe ID';
    }

    await recipeRepository.deleteRecipe(id);
  }
}
