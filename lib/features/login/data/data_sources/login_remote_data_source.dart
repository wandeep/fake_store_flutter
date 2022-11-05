import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/failures.dart';
import '../../../../core/network/environment.dart';
import '../../../../core/token/token.dart';

abstract class LoginRemoteDataSource {
  /// Calls the https://fakestoreapi.com/auth/login endpoint with the
  /// provided username and password
  ///
  Future<Either<Failure, Token>> login({required String username, required String password});
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final http.Client _client;
  final Environment _environment;

  LoginRemoteDataSourceImpl({required http.Client client, required Environment environment})
      : _client = client,
        _environment = environment;

  @override
  Future<Either<Failure, Token>> login({
    required String username,
    required String password,
  }) async {
    final url = Uri.https((_environment.baseUrl), '/auth/login');

    return _client
        .post(url,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(
              <String, String>{'username': username, 'password': password},
            ))
        .then((response) {
      if (response.statusCode == 200 && response.body.isNotEmpty) {
        final json = jsonDecode(response.body);
        final token = Token.fromJson(json);
        return Right(token);
      } else {
        return Left(
          Failure.login("Login Failure - Server responded ${response.statusCode} when attempting to login"),
        );
      }
    });
  }
}
