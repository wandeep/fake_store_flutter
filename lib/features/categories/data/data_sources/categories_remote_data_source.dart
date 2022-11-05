import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/failures.dart';
import '../../../../core/network/environment.dart';
import '../../domain/entities/category.dart';

abstract class CategoriesRemoteDataSource {
  Future<Either<Failure, List<Category>>> categories();
}

class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final http.Client _client;
  final Environment _environment;

  CategoriesRemoteDataSourceImpl({required http.Client client, required Environment environment})
      : _client = client,
        _environment = environment;

  @override
  Future<Either<Failure, List<Category>>> categories() async {
    final url = Uri.https((_environment.baseUrl), '/products/categories');

    return _client.get(url).then((response) {
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final json = jsonDecode(response.body);
        List<String> categoriesStrings = List.from(json);
        final categories = categoriesStrings.map(
          (categoryString) => Category(value: categoryString),
        );
        return Right(categories.toList());
      } else {
        return Left(
          Failure.categories(
              "Categories Failure - Server responded ${response.statusCode} when attempting to fetch categories at url ${url.path}"),
        );
      }
    });
  }
}
