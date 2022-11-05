import 'package:dynamic_height_grid_view/dynamic_height_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/cart/presentation/cubit/cart_cubit.dart';
import '../../domain/entities/product.dart';
import 'product_tile.dart';

class ProductsList extends StatelessWidget {
  final List<Product> products;

  const ProductsList({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DynamicHeightGridView(
        itemCount: products.length,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        builder: (context, index) {
          final product = products[index];
          return ProductTile(
            product: product,
            onAddTapped: () {
              context.read<CartCubit>().addToCart(product: product);
            },
            onRemoveTapped: () {
              context.read<CartCubit>().removeFromCart(product: product);
            },
          );
        });
  }
}
