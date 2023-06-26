part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final bool isLoading;
  final bool isSuccess;
  final bool isError;

  const SignUpState({
    this.isLoading = false,
    this.isSuccess = false,
    this.isError = false,
  });

  SignUpState copyWith({
    bool? isLoading,
    bool? isSuccess,
    bool? isError,
  }) {
    return SignUpState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isError: isError ?? this.isError,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        isSuccess,
        isError,
      ];
}
