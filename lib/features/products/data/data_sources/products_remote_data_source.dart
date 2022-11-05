import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/failures.dart';
import '../../../../core/network/environment.dart';
import '../model/product_model.dart';

abstract class ProductsRemoteDataSource {
  Future<Either<Failure, List<ProductModel>>> products(String category);
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final http.Client _client;
  final Environment _environment;

  ProductsRemoteDataSourceImpl({required http.Client client, required Environment environment})
      : _client = client,
        _environment = environment;

  @override
  Future<Either<Failure, List<ProductModel>>> products(String category) async {
    if (category.isEmpty) {
      return Left(Failure.products('Error - invalid category specified'));
    }
    final url = Uri.https((_environment.baseUrl), '/products/category/$category');

    return _client.get(url).then((response) {
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();
        List<ProductModel> productModels = parsed.map<ProductModel>((json) => ProductModel.fromJson(json)).toList();
        return Right(productModels);
      } else {
        return Left(
          Failure.products(
              "Products Failure - Server responded ${response.statusCode} when attempting to fetch products"),
        );
      }
    });
  }
}
