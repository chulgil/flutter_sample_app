import 'dart:io';

import 'package:flutter_sample_app/core/domain/error/network_error.dart';
import 'package:flutter_sample_app/core/domain/error/result.dart';
import 'package:flutter_sample_app/domain/repository/recipe_repository.dart';

class GetCategoriesUseCase {
  final RecipeRepository _recipeRepository;

  const GetCategoriesUseCase({required RecipeRepository recipeRepository})
    : _recipeRepository = recipeRepository;

  Future<Result<List<String>, NetworkError>> execute() async {
    try {
      final recipes = await _recipeRepository.getRecipes();
      return Result.success(['All', ...recipes.map((e) => e.category).toSet()]);
    } on SocketException {
      return Result.error(NetworkError.noInternet);
    } catch (e) {
      return Result.error(NetworkError.unknown);
    }
  }
}
