import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/token/token.dart';
import '../../../../core/token/token_repository.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/login_input.dart';
import '../repositories/login_repository.dart';

class LoginUseCase implements UseCase<Token, LoginInput> {
  final LoginRepository _loginRepository;
  final TokenRepository _tokenRepository;

  LoginUseCase({
    required LoginRepository loginRepository,
    required TokenRepository tokenRepository,
  })  : _loginRepository = loginRepository,
        _tokenRepository = tokenRepository;

  @override
  Future<Either<Failure, Token>> call(LoginInput params) async {
    return (await _loginRepository.login(username: params.username, password: params.password)).fold(
      (failure) async => Left(failure),
      (token) async {
        await _tokenRepository.cacheToken(token);
        return Right(token);
      },
    );
  }
}
