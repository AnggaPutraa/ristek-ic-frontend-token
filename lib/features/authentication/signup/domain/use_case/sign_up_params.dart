import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_params.freezed.dart';
part 'sign_up_params.g.dart';

@freezed
class SignUpParams with _$SignUpParams {
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory SignUpParams({
    required String email,
    required String password,
    required String fullName,
  }) = _SignUpParams;

  factory SignUpParams.fromJson(Map<String, dynamic> json) =>
      _$SignUpParamsFromJson(json);
}
