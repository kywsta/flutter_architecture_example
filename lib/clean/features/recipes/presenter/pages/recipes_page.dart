import 'package:flutter/material.dart';
import 'package:flutter_architecture_example/clean/features/recipes/domain/entities/recipe.dart';
import 'package:flutter_architecture_example/clean/features/recipes/presenter/providers/recipe_list.dart';
import 'package:flutter_architecture_example/clean/features/recipes/presenter/widgets/recipe_list_item.dart';
import 'package:provider/provider.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(), body: _buildBody());
  }

  AppBar _buildAppBar() {
    return AppBar(title: const Text('Recipes'));
  }

  Widget _buildBody() {
    final isLoading = context.select<RecipeList, bool>(
      (viewModel) => viewModel.isLoading,
    );
    final recipeCount = context.select<RecipeList, int>(
      (viewModel) => viewModel.recipes.length,
    );
    return isLoading && recipeCount == 0
        ? _buildLoadingIndicator()
        : _buildContent();
  }

  Widget _buildLoadingIndicator() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildContent() {
    final error = context.select<RecipeList, String?>(
      (viewModel) => viewModel.error,
    );

    return error != null ? _buildErrorIndicator(error) : _buildRecipeList();
  }

  Widget _buildErrorIndicator(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error, size: 48),
            const SizedBox(height: 8),
            Text("Error", style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 8),
            Text(error, textAlign: TextAlign.center),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: _reload, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }

  Widget _buildRecipeList() {
    final recipes = context.select<RecipeList, List<Recipe>>(
      (viewModel) => viewModel.recipes,
    );

    return RefreshIndicator(
      onRefresh: _reload,
      child: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: recipes.length,

        itemBuilder: (context, index) {
          return RecipeListItem(recipe: recipes[index]);
        },
        separatorBuilder: (context, index) => const SizedBox(height: 8),
      ),
    );
  }

  Future<void> _reload() async {
    context.read<RecipeList>().loadRecipes();
    return Future.delayed(const Duration(seconds: 2));
  }
}
