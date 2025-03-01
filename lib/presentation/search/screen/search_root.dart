import 'package:flutter/material.dart';
import 'package:flutter_sample_app/data/data_source/local/local_recent_search_recipe_data_source_impl.dart';
import 'package:flutter_sample_app/data/repository/mock_recent_search_recipe_repository_impl.dart';
import 'package:flutter_sample_app/presentation/search/screen/search_screen.dart';
import 'package:flutter_sample_app/presentation/search/search_view_model.dart';

final _recentSearchRecipeRepository = MockRecentSearchRecipeRepositoryImpl(
  recipeDataSource: LocalRecentSearchRecipeDataSourceImpl(),
);

class SearchRoot extends StatelessWidget {
  const SearchRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = SearchViewModel(
      recentSearchRecipeRepository: _recentSearchRecipeRepository,
    );

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        return SearchScreen(state: viewModel.state);
      },
    );
  }
}
