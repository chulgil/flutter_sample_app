import 'package:flutter_sample_app/domain/model/recipe.dart';

abstract interface class RecipeDataSource {

  Future<List<Map<String, dynamic>>> getRecipes();
}