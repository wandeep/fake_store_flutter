import 'package:get_it/get_it.dart';

import '../data/data_sources/login_remote_data_source.dart';
import '../data/repositories/login_repository_impl.dart';
import '../domain/repositories/login_repository.dart';
import '../domain/usecases/login_use_case.dart';
import '../presentation/cubit/login_cubit.dart';

Future<void> createLoginDependencies(GetIt getIt) async {
  getIt.registerFactory<LoginRemoteDataSource>(() => LoginRemoteDataSourceImpl(client: getIt(), environment: getIt()));

  getIt.registerFactory<LoginRepository>(() => LoginRepositoryImpl(loginRemoteDataSource: getIt()));

  getIt.registerFactory(
    () => LoginUseCase(loginRepository: getIt(), tokenRepository: getIt()),
  );

  getIt.registerFactory(
    () => LoginCubit(loginUseCase: getIt()),
  );
}
