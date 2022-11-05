import 'package:get_it/get_it.dart';

import 'cart/injection/cart_injection.dart';
import 'network/injection/network_injection.dart';
import 'secure_storage/injection/secure_storage_injection.dart';
import 'token/injection/token_injection.dart';

Future<void> createCoreDependencyTree(GetIt getIt) async {
  await createNetworkDependencies(getIt);
  await createSecureStorageDependencies(getIt);
  await createTokenDependencies(getIt);
  await createCartDependencies(getIt);
}
