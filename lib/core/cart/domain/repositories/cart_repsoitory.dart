import 'package:dartz/dartz.dart';

import '../../../../features/products/domain/entities/product.dart';
import '../../../error/failures.dart';

abstract class CartRepository {
  Future<Either<Failure, void>> addToCart(Product product);
  Future<Either<Failure, void>> removeFromCart(Product product);
  Stream<int> observeCartUpdates();
}
