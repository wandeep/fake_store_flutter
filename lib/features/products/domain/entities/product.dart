import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
class Product with _$Product {
  factory Product({
    required int id,
    required String title,
    required double price,
    required String description,
    required String category,
    required String imageUri,
    required Rating rating,
  }) = _Product;
}

@freezed
class Rating with _$Rating {
  factory Rating({
    required double rate,
    required int count,
  }) = _Rating;
}
