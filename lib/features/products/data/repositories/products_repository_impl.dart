import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/product.dart';
import '../../domain/repositories/products_repository.dart';
import '../data_sources/products_remote_data_source.dart';

class ProductsRepositoryImpl extends ProductsRepository {
  final ProductsRemoteDataSource _productsRemoteDataSource;

  ProductsRepositoryImpl({required ProductsRemoteDataSource productsRemoteDataSource})
      : _productsRemoteDataSource = productsRemoteDataSource;

  @override
  Future<Either<Failure, List<Product>>> products(String category) async {
    return (await _productsRemoteDataSource.products(category)).fold((failure) => Left(failure), (productModels) {
      return Right(productModels.map((productModel) {
        return Product(
          id: productModel.id,
          title: productModel.title,
          price: productModel.price,
          description: productModel.description,
          category: productModel.category,
          imageUri: productModel.image,
          rating: Rating(
            count: productModel.rating.count,
            rate: productModel.rating.rate,
          ),
        );
      }).toList());
    });
  }
}
