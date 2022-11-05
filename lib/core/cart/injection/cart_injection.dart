import 'package:get_it/get_it.dart';

import '../data/repositories/cart_repository_impl.dart';
import '../domain/repositories/cart_repsoitory.dart';
import '../domain/usecases/add_to_cart_use_case.dart';
import '../domain/usecases/observe_cart_use_case.dart';
import '../domain/usecases/remove_from_cart_use_case.dart';
import '../presentation/cubit/cart_cubit.dart';

Future<void> createCartDependencies(GetIt getIt) async {
  getIt.registerLazySingleton<CartRepository>(() => CartRepositoryImpl());

  getIt.registerLazySingleton(() => AddToCartUseCase(cartRepository: getIt()));

  getIt.registerLazySingleton(() => RemoveFromCartUseCase(cartRepository: getIt()));

  getIt.registerLazySingleton(() => ObserveCartUseCase(cartRepository: getIt()));

  getIt.registerLazySingleton(
    () => CartCubit(addToCartUseCase: getIt(), removeFromCartUseCase: getIt(), observeCartUseCase: getIt()),
  );
}
