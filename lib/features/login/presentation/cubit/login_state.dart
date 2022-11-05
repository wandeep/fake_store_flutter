import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/token/token.dart';

part 'login_state.freezed.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.inProgress() = _InProgress;
  const factory LoginState.success(Token token) = _Success;
  const factory LoginState.failure() = _Failure;
}
