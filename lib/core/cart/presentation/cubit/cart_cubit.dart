import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping/core/usecases/no_params.dart';

import '../../../../features/products/domain/entities/product.dart';
import '../../../utils/do_nothing.dart';
import '../../domain/usecases/add_to_cart_use_case.dart';
import '../../domain/usecases/observe_cart_use_case.dart';
import '../../domain/usecases/remove_from_cart_use_case.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final AddToCartUseCase _addToCartUseCase;
  final RemoveFromCartUseCase _removeFromCartUseCase;
  final ObserveCartUseCase _observeCartUseCase;

  StreamSubscription? _cartSubscription;

  CartCubit({
    required AddToCartUseCase addToCartUseCase,
    required RemoveFromCartUseCase removeFromCartUseCase,
    required ObserveCartUseCase observeCartUseCase,
  })  : _addToCartUseCase = addToCartUseCase,
        _removeFromCartUseCase = removeFromCartUseCase,
        _observeCartUseCase = observeCartUseCase,
        super(const CartState.initial(0));

  void addToCart({required Product product}) async {
    (await _addToCartUseCase(product)).fold(
      (failure) => doNothing('Not handled'),
      (_) => doNothing('Not handled'),
    );
  }

  void removeFromCart({required Product product}) async {
    (await _removeFromCartUseCase(product)).fold(
      (failure) => doNothing('Not handled'),
      (_) => doNothing('Not handled'),
    );
  }

  void observeCartChanges() {
    _cartSubscription ??= _observeCartUseCase(NoParams()).listen((event) {
      event.fold(
        (failure) => doNothing('Not handled'),
        (count) => emit(CartState.updated(count)),
      );
    });
  }

  @override
  Future<void> close() {
    _cartSubscription?.cancel();
    return super.close();
  }
}
