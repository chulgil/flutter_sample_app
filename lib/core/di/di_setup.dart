import 'package:flutter_sample_app/data/data_source/local/default_local_storage.dart';
import 'package:flutter_sample_app/data/data_source/remote/remote_recipe_data_source_impl.dart';
import 'package:flutter_sample_app/data/repository/mock_bookmark_repository_impl.dart';
import 'package:flutter_sample_app/data/repository/mock_recent_search_recipe_repository_impl.dart';
import 'package:flutter_sample_app/data/repository/mock_recipe_repository_impl.dart';
import 'package:flutter_sample_app/domain/data_source/local_storage.dart';
import 'package:flutter_sample_app/domain/data_source/recipe_data_source.dart';
import 'package:flutter_sample_app/domain/repository/bookmark_repository.dart';
import 'package:flutter_sample_app/domain/repository/recent_search_recipe_repository.dart';
import 'package:flutter_sample_app/domain/repository/recipe_repository.dart';
import 'package:flutter_sample_app/domain/usecase/get_saved_recipes_use_case.dart';
import 'package:flutter_sample_app/domain/usecase/search_recipes_use_case.dart';
import 'package:flutter_sample_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_sample_app/presentation/search/search_view_model.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void diSetup() {
  // data source
  getIt.registerSingleton<RecipeDataSource>(RemoteRecipeDataSourceImpl());
  getIt.registerSingleton<LocalStorage>(DefaultLocalStorage());

  getIt.registerSingleton<RecipeRepository>(
    MockRecipeRepositoryImpl(recipeDataSource: getIt()),
  );

  getIt.registerSingleton<BookmarkRepository>(MockBookmarkRepositoryImpl());
  getIt.registerSingleton<RecentSearchRecipeRepository>(
    MockRecentSearchRecipeRepositoryImpl(localStorage: getIt()),
  );

  // UseCase
  getIt.registerSingleton(
    GetSavedRecipesUseCase(
      recipeRepository: getIt(),
      bookmarkRepository: getIt(),
    ),
  );

  getIt.registerSingleton(
    SearchRecipesUseCase(recipeRepository: getIt(), localStorage: getIt()),
  );

  // viewmodel
  getIt.registerFactory<SavedRecipesViewModel>(
    () => SavedRecipesViewModel(getSavedRecipesUseCase: getIt()),
  );
  getIt.registerFactory<SearchViewModel>(
    () => SearchViewModel(
      recentSearchRecipeRepository: getIt(),
      searchRecipesUseCase: getIt(),
    ),
  );
}
