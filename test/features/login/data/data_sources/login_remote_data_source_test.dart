import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:shopping/core/error/failures.dart';
import 'package:shopping/core/network/environment.dart';
import 'package:shopping/core/token/token.dart';
import 'package:shopping/features/login/data/data_sources/login_remote_data_source.dart';

import '../../../../fixture_reader.dart';

main() {
  late LoginRemoteDataSourceImpl dataSource;
  late MockClient mockClient;
  late Environment environment;

  const tUsername = 'username';
  const tPassword = 'password';

  setUp(
    () {
      environment = Environment();
    },
  );

  group('login success', () {
    final tToken = Token(value: 'token');

    Future<http.Response> requestHandler(http.Request request) async {
      final apiResponse = fixture('login_response.json');
      return http.Response(apiResponse, 200);
    }

    setUp(() {
      mockClient = MockClient(requestHandler);
      dataSource = LoginRemoteDataSourceImpl(client: mockClient, environment: environment);
    });

    test('should perform a POST request on a URL and return TOKEN', () async {
      final result = await dataSource.login(username: tUsername, password: tPassword);
      expect(result, Right(tToken));
    });
  });

  group('login failure', () {
    Future<http.Response> requestHandler(http.Request request) async {
      const apiResponse = 'username or password is incorrect';
      return http.Response(apiResponse, 401);
    }

    setUp(() {
      mockClient = MockClient(requestHandler);
      dataSource = LoginRemoteDataSourceImpl(client: mockClient, environment: environment);
    });

    test('should return [Failure.login] if the login request failed', () async {
      final result = await dataSource.login(username: tUsername, password: tPassword);
      expect(result, Left(Failure.login('Login Failure - Server responded 401 when attempting to login')));
    });
  });
}
