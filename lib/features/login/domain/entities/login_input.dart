import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_input.freezed.dart';

@freezed
class LoginInput with _$LoginInput {
  factory LoginInput({required String username, required String password}) =
      _LoginInput;
}
