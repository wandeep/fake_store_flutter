import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:shopping/features/products/domain/entities/product.dart';
import 'package:shopping/features/products/presentation/widgets/product_tile.dart';

void main() {
  final tProduct = Product(
    id: 1,
    title: 'Product title 1',
    price: 1.99,
    description: 'Product 1 description',
    category: 'category',
    imageUri: 'http://example.com/image.jpg',
    rating: Rating(count: 120, rate: 3.9),
  );

  testWidgets('finds text and button widgets for product tile', (tester) async {
    await mockNetworkImagesFor(() async {
      await tester.pumpWidget(LocalizationsInj(
        child: Material(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: ProductTile(
              product: tProduct,
              onAddTapped: () {},
              onRemoveTapped: () {},
            ),
          ),
        ),
      ));
    });
    expect(find.text('Product title 1'), findsOneWidget);
    expect(find.text('£1.99'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Add to Cart'), findsOneWidget);
    expect(find.widgetWithText(ElevatedButton, 'Remove from Cart'), findsOneWidget);
  });
}

class LocalizationsInj extends StatelessWidget {
  final Widget child;
  const LocalizationsInj({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
      ],
      home: child,
    );
  }
}
