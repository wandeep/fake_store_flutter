import 'package:shopping/features/products/data/model/product_model.dart';

class Fixtures {
  static final List<ProductModel> productsModels = [
    ProductModel(
      id: 1,
      title: 'Product title 1',
      price: 1.99,
      description: 'Product 1 description',
      category: 'category',
      image: 'https://test.com/images/product1.jpg',
      rating: RatingModel(count: 120, rate: 3.9),
    ),
    ProductModel(
      id: 2,
      title: 'Product title 2',
      price: 2.99,
      description: 'Product 2 description',
      category: 'category',
      image: 'https://test.com/images/product2.jpg',
      rating: RatingModel(count: 50, rate: 1.9),
    ),
  ];
}
