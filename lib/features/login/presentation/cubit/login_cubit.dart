import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/login_input.dart';
import '../../domain/usecases/login_use_case.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUseCase _loginUseCase;

  LoginCubit({
    required LoginUseCase loginUseCase,
  })  : _loginUseCase = loginUseCase,
        super(const LoginState.initial());

  void login({required String username, required String password}) async {
    emit(const LoginState.inProgress());
    (await _loginUseCase(LoginInput(username: username, password: password))).fold(
      (failure) => emit(const LoginState.failure()),
      (token) => emit(LoginState.success(token)),
    );
  }
}
