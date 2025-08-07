import 'package:flutter_architecture_example/clean/features/recipes/domain/repositories/recipe_repository.dart';

class DeleteRecipeUseCase {
  final RecipeRepository postRepository;

  DeleteRecipeUseCase(this.postRepository);

  Future<void> call(int id) async {
    if (id <= 0) {
      throw 'Invalid recipe ID';
    }

    await postRepository.deleteRecipe(id);
  }
}
