import 'package:flutter/material.dart';
import 'package:flutter_sample_app/domain/filter/filter_state.dart';
import 'package:flutter_sample_app/domain/repository/recent_search_recipe_repository.dart';
import 'package:flutter_sample_app/domain/usecase/search_recipes_use_case.dart';
import 'package:flutter_sample_app/presentation/search/search_state.dart';

class SearchViewModel with ChangeNotifier {
  final RecentSearchRecipeRepository _recentSearchRecipeRepository;
  final SearchRecipesUseCase _searchRecipesUseCase;

  SearchViewModel({
    required RecentSearchRecipeRepository recentSearchRecipeRepository,
    required SearchRecipesUseCase searchRecipesUseCase,
  }) : _recentSearchRecipeRepository = recentSearchRecipeRepository,
       _searchRecipesUseCase = searchRecipesUseCase {
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

  Future<void> searchRecipes(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final recipes = await _searchRecipesUseCase.execute(
      query,
      state.filterState,
    );
    _state = state.copyWith(
      recipes: recipes,
      isLoading: false,
      searchTitle: 'Search Result',
      resultsCount: '${recipes.length} results',
      query: query,
    );
    notifyListeners();
  }

  void onChangeFilter(FilterState filterState) async {
    _state = state.copyWith(filterState: filterState);
    await searchRecipes(state.query);
    notifyListeners();
    print(state.toString());
  }
}
