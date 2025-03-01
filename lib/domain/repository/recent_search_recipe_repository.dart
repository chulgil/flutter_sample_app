import 'package:flutter_sample_app/domain/model/recipe.dart';

abstract interface class RecentSearchRecipeRepository {

  Future<List<Recipe>> getRecentSearchRecipes();

  Future<void> updateRecentSearchRecipes(List<Recipe> recipes);

}