import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../../../categories/domain/entities/category.dart';
import '../entities/product.dart';
import '../repositories/products_repository.dart';

class ProductsUseCase implements UseCase<List<Product>, Category> {
  final ProductsRepository _productsRepository;

  ProductsUseCase({
    required ProductsRepository productsRepository,
  }) : _productsRepository = productsRepository;

  @override
  Future<Either<Failure, List<Product>>> call(Category params) async {
    return (await _productsRepository.products(params.value)).fold(
      (failure) async => Left(failure),
      (products) async => Right(products),
    );
  }
}
