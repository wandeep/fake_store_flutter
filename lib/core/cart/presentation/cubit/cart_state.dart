import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial(int count) = _Initial;
  const factory CartState.updated(int count) = _Updated;
}
