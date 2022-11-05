import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/widgets/widget_helpers.dart';
import '../../domain/entities/product.dart';

class ProductTile extends StatelessWidget {
  final Product _product;
  final VoidCallback _onAddTapped;
  final VoidCallback _onRemoveTapped;

  const ProductTile({
    super.key,
    required Product product,
    required VoidCallback onAddTapped,
    required VoidCallback onRemoveTapped,
  })  : _product = product,
        _onAddTapped = onAddTapped,
        _onRemoveTapped = onRemoveTapped;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shadowColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              _product.imageUri,
              width: 100,
              height: 100,
            ),
            addVerticalSpace(8),
            Text(
              _product.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
            addVerticalSpace(8),
            Text(
              '£${_product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 15,
              ),
            ),
            addVerticalSpace(8),
            ElevatedButton(
              onPressed: () => _onAddTapped(),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(AppLocalizations.of(context)!.add_cart_button_title),
              ),
            ),
            ElevatedButton(
              onPressed: () => _onRemoveTapped(),
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: Padding(
                padding: const EdgeInsets.all(4),
                child: Text(AppLocalizations.of(context)!.remove_cart_button_title),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
