import 'package:get_it/get_it.dart';

import '../data/data_sources/products_remote_data_source.dart';
import '../data/repositories/products_repository_impl.dart';
import '../domain/repositories/products_repository.dart';
import '../domain/usecases/products_use_case.dart';
import '../presentation/cubit/products_cubit.dart';

Future<void> createProductsDependencies(GetIt getIt) async {
  getIt.registerFactory<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl(client: getIt(), environment: getIt()));

  getIt.registerFactory<ProductsRepository>(() => ProductsRepositoryImpl(productsRemoteDataSource: getIt()));

  getIt.registerFactory(() => ProductsUseCase(productsRepository: getIt()));

  getIt.registerFactory(
    () => ProductsCubit(productsUseCase: getIt()),
  );
}
