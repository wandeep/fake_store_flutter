import 'package:dartz/dartz.dart';

import '../../../error/failures.dart';
import '../../../usecases/no_params.dart';
import '../../../usecases/usecase.dart';
import '../repositories/cart_repsoitory.dart';

class ObserveCartUseCase implements StreamUseCase<int, NoParams> {
  final CartRepository _cartRepository;

  ObserveCartUseCase({required CartRepository cartRepository}) : _cartRepository = cartRepository;

  @override
  Stream<Either<Failure, int>> call(NoParams params) =>
      _cartRepository.observeCartUpdates().asyncExpand((count) async* {
        yield Right(count);
      });
}
