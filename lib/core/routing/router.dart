import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample_app/data/repository/mock_bookmark_repository_impl.dart';
import 'package:flutter_sample_app/data/repository/mock_recipe_repository_impl.dart';
import 'package:flutter_sample_app/domain/model/recipe.dart';
import 'package:flutter_sample_app/domain/usecase/get_saved_recipes_use_case.dart';
import 'package:flutter_sample_app/presentation/saved_recipes/saved_recipes_screen.dart';
import 'package:flutter_sample_app/presentation/sign_in/sign_in_screen.dart';
import 'package:flutter_sample_app/presentation/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
    GoRoute(path: '/signIn', builder: (context, state) => SignInScreen()),
    GoRoute(
      path: 'savedRecipes',
      builder:
          (context, state) => FutureBuilder<List<Recipe>>(
            future:
                GetSavedRecipesUseCase(
                  recipeRepository: MockRecipeRepositoryImpl(),
                  bookmarkRepository: MockBookmarkRepositoryImpl(),
                ).execute(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              final recipes = snapshot.data!;

              return SavedRecipesScreen(recipes: recipes);
            },
          ),
    ),
  ],
);
