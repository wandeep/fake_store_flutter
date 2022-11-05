import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/widgets/cart_widget.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/widget_helpers.dart';
import '../../../../injection_container.dart';
import '../cubit/categories_cubit.dart';
import '../cubit/categories_state.dart';
import '../widgets/category_list.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.categories_title),
        actions: const [CartWidget()],
      ),
      body: MultiBlocProvider(
        providers: [
          BlocProvider<CategoriesCubit>(create: (context) => getIt<CategoriesCubit>()..categories()),
        ],
        child: BlocProvider<CategoriesCubit>(
          create: (context) => getIt<CategoriesCubit>()..categories(),
          child: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) => state.when(
              initial: () => emptySpace(),
              inProgress: () => const LoadingWidget(),
              success: (categories) => CategoryList(categories: categories),
              failure: () => const CustomErrorWidget(),
            ),
          ),
        ),
      ),
    );
  }
}
