
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:ic_jwt/features/authentication/core/model/user_model.dart';

part 'post_model.freezed.dart';
part 'post_model.g.dart';

@freezed
class PostModel with _$PostModel {

  factory PostModel({
    required String body,
    required UserModel user,
  }) = _PostModel;

  factory PostModel.fromJson(Map<String, dynamic> json) => _$PostModelFromJson(json);
}