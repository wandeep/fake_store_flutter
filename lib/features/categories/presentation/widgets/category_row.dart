import 'package:flutter/material.dart';

import '../../domain/entities/category.dart';

class CategoryRow extends StatelessWidget {
  final Category _category;
  final VoidCallback _onTapped;

  const CategoryRow({
    super.key,
    required Category category,
    required VoidCallback onTapped,
  })  : _category = category,
        _onTapped = onTapped;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(_category.value),
        onTap: _onTapped,
      ),
    );
  }
}
