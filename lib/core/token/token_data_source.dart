import 'package:dartz/dartz.dart';

import '../error/failures.dart';
import '../secure_storage/secure_storage.dart';
import 'token.dart';

abstract class TokenDataSource {
  Future<Either<Failure, Token>> token();
  Future<void> cacheToken(Token userToken);
  Future<bool> tokenExists();
  Future<void> removeToken();
}

class TokenDataSourceImpl implements TokenDataSource {
  final SecureStorage _secureStorage;

  final _tokenKey = 'token_key';

  TokenDataSourceImpl({required SecureStorage secureStorage}) : _secureStorage = secureStorage;

  @override
  Future<void> cacheToken(Token token) => _secureStorage.writeSecureData(_tokenKey, token.value);

  @override
  Future<void> removeToken() => _secureStorage.deleteSecureData(_tokenKey);

  @override
  Future<Either<Failure, Token>> token() async {
    final tokenValue = await _secureStorage.readSecureData(_tokenKey);
    return Right(Token(value: tokenValue));
  }

  @override
  Future<bool> tokenExists() => _secureStorage.containsSecureData(_tokenKey);
}
