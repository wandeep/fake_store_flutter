import 'package:dartz/dartz.dart';

import '../../../../features/products/domain/entities/product.dart';
import '../../../error/failures.dart';
import '../../../usecases/usecase.dart';
import '../repositories/cart_repsoitory.dart';

class AddToCartUseCase implements UseCase<void, Product> {
  final CartRepository _cartRepository;

  AddToCartUseCase({required CartRepository cartRepository}) : _cartRepository = cartRepository;

  @override
  Future<Either<Failure, void>> call(Product params) => _cartRepository.addToCart(params);
}
