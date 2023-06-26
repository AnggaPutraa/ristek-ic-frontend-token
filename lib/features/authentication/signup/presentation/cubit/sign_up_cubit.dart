import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ic_jwt/features/authentication/core/repositories/authentication_repositories.dart';
import 'package:ic_jwt/features/authentication/signup/domain/use_case/sign_up_params.dart';
import 'package:injectable/injectable.dart';

part 'sign_up_state.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> {
  final AuthenticationRepository _repository = AuthenticationRepository();
  SignUpCubit() : super(const SignUpState());

  void signUp({
    required String fullName,
    required String email,
    required String password,
  }) async {
    emit(
      state.copyWith(isLoading: true),
    );

    SignUpParams signUpParams = SignUpParams(
      email: email,
      password: password,
      fullName: fullName,
    );

    try {
      await _repository.signUp(signUpParams);
      emit(state.copyWith(
        isLoading: false,
        isSuccess: true,
      ));
    } catch (e) {
      emit(state.copyWith(
        isLoading: false,
        isError: true,
      ));
    }
  }
}
