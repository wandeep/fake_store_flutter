import 'package:get_it/get_it.dart';

import '../secure_storage.dart';

Future<void> createSecureStorageDependencies(GetIt getIt) async {
  getIt.registerLazySingleton(() => SecureStorage());
}
