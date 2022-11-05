import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../environment.dart';

Future<void> createNetworkDependencies(GetIt getIt) async {
  getIt.registerLazySingleton(() => http.Client());
  getIt.registerLazySingleton(() => Environment());
}
