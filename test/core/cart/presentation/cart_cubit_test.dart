// ignore_for_file: prefer_const_constructors, void_checks

import 'dart:ffi';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shopping/core/cart/domain/usecases/add_to_cart_use_case.dart';
import 'package:shopping/core/cart/domain/usecases/observe_cart_use_case.dart';
import 'package:shopping/core/cart/domain/usecases/remove_from_cart_use_case.dart';
import 'package:shopping/core/cart/presentation/cubit/cart_cubit.dart';
import 'package:shopping/core/cart/presentation/cubit/cart_state.dart';
import 'package:shopping/core/usecases/no_params.dart';
import 'package:shopping/features/products/domain/entities/product.dart';

import 'cart_cubit_test.mocks.dart';

@GenerateMocks([
  AddToCartUseCase,
  RemoveFromCartUseCase,
  ObserveCartUseCase,
])
void main() {
  late CartCubit cartCubit;
  late MockAddToCartUseCase mockAddToCartUseCase;
  late MockRemoveFromCartUseCase mockRemoveFromCartUseCase;
  late MockObserveCartUseCase mockObserveCartUseCase;

  final tProductRating = Rating(rate: 4.0, count: 100);
  final tProduct = Product(
      id: 1,
      title: 'title',
      price: 9.99,
      description: 'description',
      category: 'category',
      imageUri: 'imageUri',
      rating: tProductRating);

  setUp(() {
    mockAddToCartUseCase = MockAddToCartUseCase();
    mockRemoveFromCartUseCase = MockRemoveFromCartUseCase();
    mockObserveCartUseCase = MockObserveCartUseCase();

    cartCubit = CartCubit(
        addToCartUseCase: mockAddToCartUseCase,
        removeFromCartUseCase: mockRemoveFromCartUseCase,
        observeCartUseCase: mockObserveCartUseCase);
  });

  blocTest<CartCubit, CartState>(
    'Emits [initial] state when cartCubit is first loaded',
    build: () => cartCubit,
    verify: (cubit) => expect(cubit.state, CartState.initial(0)),
  );

  blocTest<CartCubit, CartState>(
    'emits [CartState.cartUpdated] when '
    'addToCart() is called.',
    setUp: () {
      when(mockObserveCartUseCase(NoParams())).thenAnswer((_) => Stream.fromIterable([Right(1)]));
      when(mockAddToCartUseCase(any)).thenAnswer((_) async => Right(Void));
    },
    build: () => cartCubit,
    act: (cubit) {
      cartCubit.observeCartChanges();
      cartCubit.addToCart(product: tProduct);
    },
    verify: (cubit) => expect(cubit.state, CartState.updated(1)),
  );

  blocTest<CartCubit, CartState>(
    'emits [CartState.cartUpdated] when '
    'removeFromCart() is called.',
    setUp: () {
      when(mockObserveCartUseCase(NoParams())).thenAnswer((_) => Stream.fromIterable([Right(0)]));
      when(mockRemoveFromCartUseCase(any)).thenAnswer((_) async => Right(Void));
    },
    build: () => cartCubit,
    act: (cubit) {
      cartCubit.observeCartChanges();
      cartCubit.removeFromCart(product: tProduct);
    },
    verify: (cubit) => expect(cubit.state, CartState.updated(0)),
  );
}
