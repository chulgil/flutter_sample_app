import 'package:flutter/material.dart';
import 'package:flutter_sample_app/data/data_source/remote/remote_recipe_data_source_impl.dart';
import 'package:flutter_sample_app/data/repository/mock_bookmark_repository_impl.dart';
import 'package:flutter_sample_app/data/repository/mock_recipe_repository_impl.dart';
import 'package:flutter_sample_app/domain/usecase/get_saved_recipes_use_case.dart';
import 'package:flutter_sample_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_sample_app/presentation/saved_recipes/screen/saved_recipes_screen.dart';

final _getSavedRecipesUseCase = GetSavedRecipesUseCase(
  recipeRepository: MockRecipeRepositoryImpl(
    recipeDataSource: RemoteRecipeDataSourceImpl(),
  ),
  bookmarkRepository: MockBookmarkRepositoryImpl(),
);

class SavedRecipesRoot extends StatelessWidget {
  const SavedRecipesRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = SavedRecipesViewModel(
      getSavedRecipesUseCase: _getSavedRecipesUseCase,
    );

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, widget) {
        if (viewModel.state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return SavedRecipesScreen(recipes: viewModel.state.recipes);
      },
    );
  }
}
