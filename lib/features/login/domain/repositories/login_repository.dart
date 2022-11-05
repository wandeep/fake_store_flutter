import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/token/token.dart';

abstract class LoginRepository {
  Future<Either<Failure, Token>> login({required String username, required String password});
}
