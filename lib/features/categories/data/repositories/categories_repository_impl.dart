import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/categories_repository.dart';
import '../data_sources/categories_remote_data_source.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final CategoriesRemoteDataSource _categoriesRemoteDataSource;

  CategoriesRepositoryImpl({required CategoriesRemoteDataSource categoriesRemoteDataSource})
      : _categoriesRemoteDataSource = categoriesRemoteDataSource;

  @override
  Future<Either<Failure, List<Category>>> categories() async => _categoriesRemoteDataSource.categories();
}
