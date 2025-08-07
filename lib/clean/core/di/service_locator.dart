import 'package:flutter_architecture_example/clean/features/recipes/data/data_sources/recipe_remote_data_source.dart';
import 'package:flutter_architecture_example/clean/features/recipes/data/repositories/recipe_repository_impl.dart';
import 'package:flutter_architecture_example/clean/features/recipes/domain/repositories/recipe_repository.dart';
import 'package:flutter_architecture_example/clean/features/recipes/domain/use_cases/get_posts_use_case.dart';
import 'package:flutter_architecture_example/clean/features/recipes/presenter/providers/recipe_list.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  final httpClient = http.Client();
  serviceLocator.registerLazySingleton(() => httpClient);

  serviceLocator.registerLazySingleton<RecipeRemoteDataSource>(
    () => RecipeRemoteDataSourceImpl(client: httpClient),
  );

  serviceLocator.registerLazySingleton<RecipeRepository>(
    () => RecipeRepositoryImpl(remoteDataSource: serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => GerRecipesUseCase(serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => RecipeList(getRecipesUseCase: serviceLocator()),
  );
}
