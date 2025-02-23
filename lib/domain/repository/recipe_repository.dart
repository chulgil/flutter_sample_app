import 'package:flutter_sample_app/domain/model/recipe.dart';

abstract interface class RecipeRepository {
  Future<List<Recipe>> getRecipes();
  Future<Recipe?> getRecipe(int id);
  

}