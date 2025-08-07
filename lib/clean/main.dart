import 'package:flutter/material.dart';
import 'package:flutter_architecture_example/clean/core/di/service_locator.dart';
import 'package:flutter_architecture_example/clean/features/recipes/presenter/pages/recipes_page.dart';
import 'package:flutter_architecture_example/clean/features/recipes/presenter/providers/recipe_list.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  setupServiceLocator();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clean Architecture Example',
      theme: ThemeData.light(useMaterial3: true),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => serviceLocator<RecipeList>()..loadRecipes(),
          ),
        ],
        child: const RecipesPage(),
      ),
    );
  }
}
