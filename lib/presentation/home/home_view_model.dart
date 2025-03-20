import 'dart:async';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_sample_app/core/domain/error/network_error.dart';
import 'package:flutter_sample_app/core/domain/error/result.dart';
import 'package:flutter_sample_app/core/presentation/components/recipe_category_selector.dart';
import 'package:flutter_sample_app/domain/usecase/get_categories_use_case.dart';
import 'package:flutter_sample_app/domain/usecase/get_dishes_by_category_use_case.dart';
import 'package:flutter_sample_app/presentation/home/home_state.dart';

class HomeViewModel with ChangeNotifier {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetDishesByCategoryUseCase _getDishesByCategoryUseCase;

  final _eventController = StreamController<NetworkError>();
  Stream<NetworkError> get eventStream => _eventController.stream;

  HomeViewModel({
    required GetCategoriesUseCase getCategoriesUseCase,
    required GetDishesByCategoryUseCase getDishesByCategoryUseCase,
  }) : _getCategoriesUseCase = getCategoriesUseCase,
       _getDishesByCategoryUseCase = getDishesByCategoryUseCase {
    _fetchCategories();
  }

  HomeState _state = const HomeState();

  HomeState get state => _state;

  void _fetchCategories() async {
    final result = await _getCategoriesUseCase.execute();

    switch (result) {
      case ResultSuccess<List<String>, NetworkError>():
        _state = state.copyWith(
          categories: result.data,
          selectedCategory: 'All',
        );
        notifyListeners();

        await _fetchDishesByCategory('All');
        notifyListeners();

      case ResultError<List<String>, NetworkError>():
        switch (result.error) {
          case NetworkError.requestTimeout:
          case NetworkError.noInternet:
          case NetworkError.serverError:
          case NetworkError.unknown:
        }
        log(result.error.toString());
        _eventController.add(result.error);
    }
  }

  Future<void> _fetchDishesByCategory(String category) async {
    final dishes = await _getDishesByCategoryUseCase.execute(category);
    _state = state.copyWith(dishes: dishes);
    notifyListeners();
  }

  void onSelectCategory(String category) async {
    _state = state.copyWith(selectedCategory: category);
    notifyListeners();
    await _fetchDishesByCategory(category);
  }
}
