import 'package:ic_jwt/features/authentication/core/data_source/authentication_data_source.dart';
import 'package:ic_jwt/features/authentication/core/model/acces_token_model.dart';
import 'package:ic_jwt/features/authentication/signin/domain/use_case/sign_in_params.dart';
import 'package:ic_jwt/features/authentication/signup/domain/use_case/sign_up_params.dart';

import '../../../../core/extensions/response.dart';

class AuthenticationRepository {
  final AuthenticationDataSource _dataSource = AuthenticationDataSource();
  Future<Parsed<void>?> signUp(SignUpParams signUpParams) async {
    return await _dataSource.signUp(signUpParams);
  }
  Future<Parsed<AccessTokenModel>?> signIn(SignInParams signInParams) async {
    return await _dataSource.signIn(signInParams);
  }
}
