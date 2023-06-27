import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ic_jwt/features/authentication/core/model/user_model.dart';
import 'package:injectable/injectable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../../../../core/constants/preferences_keys.dart';
import '../../../../../services/shared_preference_service.dart';
import '../../../core/repositories/authentication_repositories.dart';
import '../../domain/use_case/sign_in_params.dart';

part 'sign_in_state.dart';

@injectable
class SignInCubit extends Cubit<SignInState> {
  final AuthenticationRepository _repository = AuthenticationRepository();
  SignInCubit() : super(const SignInState());

  void signIn({
    required String email,
    required String password,
  }) async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    final params = SignInParams(
      email: email,
      password: password,
    );
    
    try {
      final resp = await _repository.signIn(params);
      final token = resp!.data.token;

      final user = UserModel.fromJson(
        JwtDecoder.decode(
          token
        ),
      );

      await SharedPreferencesService.saveToken(
        resp.data.token,
      );
      
      await SharedPreferencesService.saveString(
        PreferencesKeys.email,
        user.email,
      );

      await SharedPreferencesService.saveString(
        PreferencesKeys.fullName,
        user.fullName,
      );

      emit(
        state.copyWith(
          isLoading: false,
          isSuccess: true,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isError: true,
          isLoading: false,
        ),
      );
    }
  }
}
