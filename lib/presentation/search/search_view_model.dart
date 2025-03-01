import 'package:flutter/material.dart';
import 'package:flutter_sample_app/domain/repository/recent_search_recipe_repository.dart';
import 'package:flutter_sample_app/domain/usecase/search_recipes_use_case.dart';
import 'package:flutter_sample_app/presentation/search/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final RecentSearchRecipeRepository _recentSearchRecipeRepository;
  final SearchRecipesUseCase _searchRecipesUseCase;

  SearchViewModel({
    required RecentSearchRecipeRepository recentSearchRecipeRepository,
    required SearchRecipesUseCase searchRecipesUsecase,
  }) : _recentSearchRecipeRepository = recentSearchRecipeRepository,
       _searchRecipesUseCase = searchRecipesUsecase {
    _loadRecentSearchRecipes();
  }

  SearchState _state = const SearchState();

  SearchState get state => _state;

  void _loadRecentSearchRecipes() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _recentSearchRecipeRepository.getRecentSearchRecipes(),
      isLoading: false,
    );
    notifyListeners();
  }

  void searchRecipes(String query) async {

    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      recipes: await _searchRecipesUseCase.excute(query),
      isLoading: false,
    );
    notifyListeners();

    final results = await _searchRecipesUseCase.excute(query);
  }

}
