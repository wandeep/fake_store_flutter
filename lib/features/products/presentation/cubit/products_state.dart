import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/product.dart';

part 'products_state.freezed.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState.initial() = _Initial;
  const factory ProductsState.inProgress() = _InProgress;
  const factory ProductsState.success(List<Product> products) = _Success;
  const factory ProductsState.failure() = _Failure;
}
