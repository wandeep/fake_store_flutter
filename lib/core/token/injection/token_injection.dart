import 'package:get_it/get_it.dart';

import '../token_data_source.dart';
import '../token_repository.dart';

Future<void> createTokenDependencies(GetIt getIt) async {
  getIt.registerFactory<TokenDataSource>(() => TokenDataSourceImpl(secureStorage: getIt()));

  getIt.registerFactory<TokenRepository>(() => TokenRepositoryImpl(tokenDataSource: getIt()));
}
