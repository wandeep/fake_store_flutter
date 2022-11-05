import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/no_params.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/category.dart';
import '../repositories/categories_repository.dart';

class CategoriesUseCase implements UseCase<List<Category>, NoParams> {
  final CategoriesRepository _categoriesRepository;

  CategoriesUseCase({
    required CategoriesRepository categoriesRepository,
  }) : _categoriesRepository = categoriesRepository;

  @override
  Future<Either<Failure, List<Category>>> call(NoParams params) async {
    return (await _categoriesRepository.categories()).fold(
      (failure) async => Left(failure),
      (categories) async => Right(categories),
    );
  }
}
