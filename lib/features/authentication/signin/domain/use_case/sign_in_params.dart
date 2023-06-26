import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_params.freezed.dart';
part 'sign_in_params.g.dart';

@freezed
class SignInParams with _$SignInParams {
  factory SignInParams({
    required String email,
    required String password
  }) = _SignInParams;

  factory SignInParams.fromJson(Map<String, dynamic> json) =>
      _$SignInParamsFromJson(json);
}
