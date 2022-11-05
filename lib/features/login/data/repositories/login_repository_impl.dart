import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/token/token.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/login_remote_data_source.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource _loginRemoteDataSource;

  LoginRepositoryImpl({required LoginRemoteDataSource loginRemoteDataSource})
      : _loginRemoteDataSource = loginRemoteDataSource;

  @override
  Future<Either<Failure, Token>> login({
    required String username,
    required String password,
  }) async =>
      _loginRemoteDataSource.login(username: username, password: password);
}
