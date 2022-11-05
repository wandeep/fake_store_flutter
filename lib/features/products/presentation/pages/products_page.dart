import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/cart_widget.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/widgets/widget_helpers.dart';
import '../../../../injection_container.dart';
import '../../../categories/domain/entities/category.dart';
import '../cubit/products_cubit.dart';
import '../cubit/products_state.dart';
import '../widgets/products_list.dart';

class ProductsPage extends StatelessWidget {
  final String category;

  const ProductsPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(category),
          actions: const [CartWidget()],
        ),
        body: MultiBlocProvider(
          providers: [
            BlocProvider<ProductsCubit>(
                create: (context) => getIt<ProductsCubit>()..products(Category(value: category))),
          ],
          child: BlocBuilder<ProductsCubit, ProductsState>(
            builder: (context, state) => state.when(
              initial: () => emptySpace(),
              inProgress: () => const LoadingWidget(),
              success: (products) => ProductsList(products: products),
              failure: () => const CustomErrorWidget(),
            ),
          ),
        ),
      );
}
