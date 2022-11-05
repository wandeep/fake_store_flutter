import 'package:get_it/get_it.dart';

import 'core/core_injection.dart';
import 'features/features_injection.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  getIt.registerFactory(() => _MainIsolateInjection());
  return await _initDependencies();
}

Future<void> _initDependencies() async {
  getIt.registerFactory(() => _InjectionRegistered());
  await createCoreDependencyTree(getIt);
  await createFeaturesDependencyTree(getIt);
}

extension GetItExtensions on GetIt {
  bool alreadyRegistered() => getIt.isRegistered<_InjectionRegistered>();
  bool isMainIsolate() => getIt.isRegistered<_MainIsolateInjection>();
}

class _MainIsolateInjection {}

class _InjectionRegistered {}
