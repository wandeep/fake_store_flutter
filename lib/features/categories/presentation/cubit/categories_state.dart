import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/category.dart';

part 'categories_state.freezed.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;
  const factory CategoriesState.inProgress() = _InProgress;
  const factory CategoriesState.success(List<Category> categories) = _Success;
  const factory CategoriesState.failure() = _Failure;
}
