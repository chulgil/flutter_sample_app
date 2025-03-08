import 'package:flutter_sample_app/domain/data_source/local_storage.dart';
import 'package:flutter_sample_app/domain/data_source/recipe_data_source.dart';
import 'package:flutter_sample_app/domain/model/recipe.dart';
import 'package:flutter_sample_app/domain/repository/recent_search_recipe_repository.dart';

class MockRecentSearchRecipeRepositoryImpl
    implements RecentSearchRecipeRepository {
  final LocalStorage _localStorage;

  const MockRecentSearchRecipeRepositoryImpl({
    required LocalStorage recipeDataSource,
  }) : _localStorage = recipeDataSource;

  @override
  Future<List<Recipe>> getRecentSearchRecipes() async {
    try {
      final json = await _localStorage.load();
      return (json['recipes'] as Iterable)
          .map((e) => Recipe.fromJson(e))
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> updateRecentSearchRecipes(List<Recipe> recipes) async {
    await _localStorage.save({'recipes': recipes.map((e) => e.toJson())});
  }
}
