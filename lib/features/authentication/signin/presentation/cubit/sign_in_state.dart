part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final bool isError;

  const SignInState({
    this.isLoading = false,
    this.isSuccess = false,
    this.isError = false,
  });

  SignInState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
  }) {
    return SignInState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isSuccess,
        isError,
      ];
}
