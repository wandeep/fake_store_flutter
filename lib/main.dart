import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'core/cart/presentation/cubit/cart_cubit.dart';
import 'features/categories/presentation/pages/categories_page.dart';
import 'features/login/presentation/pages/login_page.dart';
import 'features/products/presentation/pages/products_page.dart';
import 'injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider<CartCubit>(create: (context) => getIt<CartCubit>()..observeCartChanges())],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _router,
        onGenerateTitle: ((context) => AppLocalizations.of(context)!.app_title),
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
        ],
      ),
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        name: 'login',
        path: '/login',
        pageBuilder: (context, state) {
          return MaterialPage(
            key: state.pageKey,
            child: const LoginPage(),
          );
        },
      ),
      GoRoute(
          name: 'categories',
          path: '/categories',
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              child: const CategoriesPage(),
            );
          },
          routes: [
            GoRoute(
              name: 'productsByCategory',
              path: ':category',
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: ProductsPage(
                    category: state.params['category']!,
                  ),
                );
              },
            ),
          ]),
    ],
  );
}
