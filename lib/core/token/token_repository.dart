import 'dart:async';
import 'package:dartz/dartz.dart';

import '../error/failures.dart';
import 'token.dart';
import 'token_data_source.dart';

abstract class TokenRepository {
  Future<Either<Failure, Token>> token();
  Future<void> cacheToken(Token token);
  Future<bool> tokenExists();
  Future<void> removeToken();
}

class TokenRepositoryImpl implements TokenRepository {
  final TokenDataSource _tokenDataSource;

  TokenRepositoryImpl({
    required TokenDataSource tokenDataSource,
  }) : _tokenDataSource = tokenDataSource;

  @override
  Future<void> cacheToken(Token token) => _tokenDataSource.cacheToken(token);

  @override
  Future<void> removeToken() => _tokenDataSource.removeToken();

  @override
  Future<Either<Failure, Token>> token() => _tokenDataSource.token();

  @override
  Future<bool> tokenExists() => _tokenDataSource.tokenExists();
}
