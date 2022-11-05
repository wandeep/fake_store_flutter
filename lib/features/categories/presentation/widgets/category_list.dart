import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/entities/category.dart';
import 'category_row.dart';

class CategoryList extends StatelessWidget {
  final List<Category> categories;

  const CategoryList({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      itemCount: categories.length,
      itemBuilder: (context, index) {
        final category = categories[index];
        return CategoryRow(
            category: category,
            onTapped: () {
              context.goNamed(
                'productsByCategory',
                params: {'category': category.value},
              );
            });
      },
    );
  }
}
