import 'package:flutter/material.dart';
import 'package:flutter_sample_app/data/data_source/local/default_local_storage.dart';
import 'package:flutter_sample_app/data/data_source/local/local_recent_search_recipe_data_source_impl.dart';
import 'package:flutter_sample_app/data/data_source/remote/remote_recipe_data_source_impl.dart';
import 'package:flutter_sample_app/data/repository/mock_recent_search_recipe_repository_impl.dart';
import 'package:flutter_sample_app/data/repository/mock_recipe_repository_impl.dart';
import 'package:flutter_sample_app/domain/data_source/local_storage.dart';
import 'package:flutter_sample_app/domain/usecase/search_recipes_use_case.dart';
import 'package:flutter_sample_app/presentation/search/screen/search_screen.dart';
import 'package:flutter_sample_app/presentation/search/search_view_model.dart';

final LocalStorage _localStorage = DefaultLocalStorage();

final _recentSearchRecipeRepository = MockRecentSearchRecipeRepositoryImpl(
  recipeDataSource: _localStorage,
);

class SearchRoot extends StatelessWidget {
  const SearchRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = SearchViewModel(
      recentSearchRecipeRepository: _recentSearchRecipeRepository,
      searchRecipesUseCase: SearchRecipesUseCase(
        recipeRepository: MockRecipeRepositoryImpl(
          recipeDataSource: RemoteRecipeDataSourceImpl(),
        ),
        localStorage: _localStorage,
      ),
    );

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        return SearchScreen(
          state: viewModel.state,
          onChanged: viewModel.searchRecipes,
        );
      },
    );
  }
}
