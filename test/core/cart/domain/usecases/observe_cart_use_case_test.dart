// ignore_for_file: prefer_const_constructors

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shopping/core/cart/domain/repositories/cart_repsoitory.dart';
import 'package:shopping/core/cart/domain/usecases/observe_cart_use_case.dart';
import 'package:shopping/core/usecases/no_params.dart';

import 'observe_cart_use_case_test.mocks.dart';

@GenerateMocks([
  CartRepository,
])
main() {
  late MockCartRepository mockCartRepository;

  late ObserveCartUseCase useCase;

  setUp(() {
    mockCartRepository = MockCartRepository();
    useCase = ObserveCartUseCase(cartRepository: mockCartRepository);
  });

  test('observeCartUpdates emits the correct cart counts in order', () async {
    when(mockCartRepository.observeCartUpdates()).thenAnswer((_) => Stream.fromIterable([
          0,
          1,
          2,
          1,
          0,
        ]));

    final result = useCase.call(NoParams());
    expect(
        result,
        emitsInOrder([
          Right(0),
          Right(1),
          Right(2),
          Right(1),
          Right(0),
          emitsDone,
        ]));
  });
}
