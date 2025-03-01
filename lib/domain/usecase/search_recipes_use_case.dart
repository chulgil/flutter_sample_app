import 'package:flutter_sample_app/domain/model/recipe.dart';
import 'package:flutter_sample_app/domain/repository/recipe_repository.dart';

class SearchRecipesUseCase {
  final RecipeRepository _recipeRepository;

  const SearchRecipesUseCase({
    required RecipeRepository recipeRepository,
  }) : _recipeRepository = recipeRepository;

  Future<List<Recipe>> excute(String query) async {
    final results = (await _recipeRepository.getRecipes()).where(
      (e) => e.name.toLowerCase().contains(query.toLowerCase()),
    );
    return results.toList();
  }
}
