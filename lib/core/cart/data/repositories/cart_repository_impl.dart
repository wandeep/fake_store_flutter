import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:shopping/features/products/domain/entities/product.dart';

import '../../../error/failures.dart';
import '../../domain/repositories/cart_repsoitory.dart';

class CartRepositoryImpl extends CartRepository {
  List<Product> cart = [];
  StreamController<int> controller = StreamController<int>.broadcast();

  @override
  Future<Either<Failure, void>> addToCart(Product product) async {
    cart.add(product);
    controller.add(cart.length);
    return const Right(null);
  }

  @override
  Future<Either<Failure, void>> removeFromCart(Product product) async {
    cart.remove(product);
    controller.add(cart.length);
    return const Right(null);
  }

  @override
  Stream<int> observeCartUpdates() => controller.stream.asBroadcastStream();
}
