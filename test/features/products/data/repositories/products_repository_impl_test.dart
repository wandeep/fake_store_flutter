// ignore_for_file: prefer_const_constructors

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shopping/core/error/failures.dart';
import 'package:shopping/features/products/data/data_sources/products_remote_data_source.dart';
import 'package:shopping/features/products/data/repositories/products_repository_impl.dart';
import 'package:shopping/features/products/domain/entities/product.dart';

import '../../../../fixtures.dart';
import 'products_repository_impl_test.mocks.dart';

@GenerateMocks([ProductsRemoteDataSource])
main() {
  late MockProductsRemoteDataSource mockProductsRemoteDataSource;

  late ProductsRepositoryImpl repository;

  setUp(() {
    mockProductsRemoteDataSource = MockProductsRemoteDataSource();
    repository = ProductsRepositoryImpl(productsRemoteDataSource: mockProductsRemoteDataSource);
  });

  group(
    'getProducts',
    () {
      const tCategory = 'category';
      final tProductModels = Fixtures.productsModels;
      final tFailure = Failure.products('error message');

      test(
        'should return Products mapped from ProductModels',
        () async {
          // Given
          when(mockProductsRemoteDataSource.products(any)).thenAnswer((_) async => Right(tProductModels));
          // When
          final result = await repository.products(tCategory);
          // Then
          expect(result, isInstanceOf<Either<Failure, List<Product>>>());
          verify(mockProductsRemoteDataSource.products(any)).called(1);
        },
      );

      test(
        'should return Failure if failed to get products',
        () async {
          // Given
          when(mockProductsRemoteDataSource.products(any)).thenAnswer((_) async => Left(tFailure));
          // When
          final result = await repository.products(tCategory);
          // Then
          expect(result, Left(tFailure));
          verify(mockProductsRemoteDataSource.products(any)).called(1);
        },
      );
    },
  );
}
