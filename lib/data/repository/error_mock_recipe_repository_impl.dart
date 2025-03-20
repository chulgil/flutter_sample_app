import 'dart:io';

import 'package:flutter_sample_app/domain/data_source/recipe_data_source.dart';
import 'package:flutter_sample_app/domain/model/recipe.dart';
import 'package:flutter_sample_app/domain/repository/recipe_repository.dart';

class ErrorMockRecipeRepositoryImpl implements RecipeRepository {
  final RecipeDataSource _recipeDataSource;

  ErrorMockRecipeRepositoryImpl({required RecipeDataSource recipeDataSource})
    : _recipeDataSource = recipeDataSource;

  @override
  Future<Recipe?> getRecipe(int id) async {
    final recipes = await getRecipes();
    return recipes.where((e) => e.id == id).firstOrNull;
  }

  @override
  Future<List<Recipe>> getRecipes() async {
    throw Exception();
    // throw const SocketException('인터넷 문제');
  }
}
