import 'package:get_it/get_it.dart';

import '../data/data_sources/categories_remote_data_source.dart';
import '../data/repositories/categories_repository_impl.dart';
import '../domain/repositories/categories_repository.dart';
import '../domain/usecases/categories_use_case.dart';
import '../presentation/cubit/categories_cubit.dart';

Future<void> createCategoriesDependencies(GetIt getIt) async {
  getIt.registerFactory<CategoriesRemoteDataSource>(
      () => CategoriesRemoteDataSourceImpl(client: getIt(), environment: getIt()));

  getIt.registerFactory<CategoriesRepository>(() => CategoriesRepositoryImpl(categoriesRemoteDataSource: getIt()));

  getIt.registerFactory(() => CategoriesUseCase(categoriesRepository: getIt()));

  getIt.registerFactory(
    () => CategoriesCubit(categoriesUseCase: getIt()),
  );
}
