import 'package:get_it/get_it.dart';

import 'categories/injection/categories_injection.dart';
import 'login/injection/login_injection.dart';
import 'products/injection/products_injection.dart';

Future<void> createFeaturesDependencyTree(GetIt getIt) async {
  await createLoginDependencies(getIt);
  await createCategoriesDependencies(getIt);
  await createProductsDependencies(getIt);
}
