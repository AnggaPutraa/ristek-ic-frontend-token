import 'package:ic_jwt/core/client/dio.dart';
import 'package:ic_jwt/core/extensions/response.dart';
import 'package:ic_jwt/features/authentication/signup/domain/use_case/sign_up_params.dart';

import '../../../../core/environments/endpoints.dart';
import '../../signin/domain/use_case/sign_in_params.dart';
import '../model/acces_token_model.dart';

class AuthenticationDataSource {
  Future<Parsed<void>?> signUp(
    SignUpParams signUpParams,
  ) async {
    const url = Endpoints.signUp;
    
    try {
      final resp = await postIt(
        url,
        model: signUpParams.toJson(),
      );
      return resp.parse(null);
    } catch (e) {
      return null;
    }
  }

  Future<Parsed<AccessTokenModel>?> signIn(
    SignInParams signInParams,
  ) async {
    const url = Endpoints.signIn;
    try {
      final resp = await postIt(
        url,
        model: signInParams.toJson(),
      );
      final accessTokenModel = AccessTokenModel.fromJson(
        resp.bodyAsMap,
      );
      return resp.parse(accessTokenModel);
    } catch (e) {
      return null;
    }
  }
}
