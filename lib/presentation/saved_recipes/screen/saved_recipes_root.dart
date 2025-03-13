import 'package:flutter/material.dart';
import 'package:flutter_sample_app/core/di/di_setup.dart';
import 'package:flutter_sample_app/presentation/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_sample_app/presentation/saved_recipes/screen/saved_recipes_screen.dart';

class SavedRecipesRoot extends StatelessWidget {
  const SavedRecipesRoot({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = getIt<SavedRecipesViewModel>();

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
