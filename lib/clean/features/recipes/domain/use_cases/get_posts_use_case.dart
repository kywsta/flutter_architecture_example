import 'package:flutter_architecture_example/clean/features/recipes/domain/entities/recipe.dart';
import 'package:flutter_architecture_example/clean/features/recipes/domain/repositories/recipe_repository.dart';

class GerRecipesUseCase {
  final RecipeRepository postRepository;

  GerRecipesUseCase(this.postRepository);

  Future<List<Recipe>> call() async {
    return await postRepository.getRecipes();
  }
}
