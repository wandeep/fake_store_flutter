import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shopping/features/categories/domain/entities/category.dart';
import 'package:shopping/features/categories/presentation/widgets/category_row.dart';

void main() {
  final tCategory = Category(value: 'category');

  testWidgets('finds a Text widget for category title', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Material(
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: CategoryRow(
            category: tCategory,
            onTapped: () {},
          ),
        ),
      ),
    ));

    expect(find.text('category'), findsOneWidget);
  });
}
