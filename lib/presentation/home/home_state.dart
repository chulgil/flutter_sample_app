import 'package:flutter_sample_app/domain/model/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) List<String> categories,
    @Default('All') String selectedCategory,
    @Default([]) List<Recipe> dishes,
  }) = _HomeState;
}
