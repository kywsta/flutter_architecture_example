import 'package:flutter_architecture_example/clean/features/recipes/domain/entities/recipe.dart';
import 'package:flutter_architecture_example/clean/features/recipes/domain/repositories/recipe_repository.dart';

class GetRecipeByIdUseCase {
  final RecipeRepository recipeRepository;

  GetRecipeByIdUseCase(this.recipeRepository);

  Future<Recipe> call(int id) async {
    if (id <= 0) {
      throw 'Invalid recipe ID';
    }

    return await recipeRepository.getRecipeById(id);
  }
}
