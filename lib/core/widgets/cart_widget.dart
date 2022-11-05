import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cart/presentation/cubit/cart_cubit.dart';
import '../cart/presentation/cubit/cart_state.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) => state.when(
        initial: (count) => _count(count),
        updated: (count) => _count(count),
      ),
    );
  }

  Widget _count(int count) {
    return Badge(
      position: BadgePosition.topEnd(top: 0, end: 3),
      animationDuration: const Duration(milliseconds: 400),
      animationType: BadgeAnimationType.scale,
      badgeContent: Text(
        count.toString(),
        style: const TextStyle(color: Colors.white),
      ),
      child: const Icon(Icons.shopping_cart),
    );
  }
}
