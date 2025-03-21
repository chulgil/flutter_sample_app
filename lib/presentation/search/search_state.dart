import 'package:flutter_sample_app/domain/filter/filter_state.dart';
import 'package:flutter_sample_app/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState({
    @Default([]) List<Recipe> recipes,
    @Default(false) bool isLoading,
    @Default('Recent Search') String searchTitle,
    @Default('') String resultsCount,
    @Default(FilterState(time: 'All', rate: 1, category: 'All'))
    FilterState filterState,
    @Default('') String query,
  }) = _SearchState;
}
