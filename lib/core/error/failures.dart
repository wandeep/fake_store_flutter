import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

@freezed
class Failure with _$Failure {
  factory Failure.noInternetConnection() = _NoInternetFailure;
  factory Failure.noResponseData(String message) = _NoResponseData;
  factory Failure.jsonDecode(String message) = _JsonDecodeFailure;
  factory Failure.login(String message) = _LoginFailure;
  factory Failure.categories(String message) = _CategoriesFailure;
  factory Failure.products(String message) = _ProductsFailure;
}
