part of 'app_initialization_cubit.dart';

class AppInitializationState extends Equatable {
  final bool isLoading;
  final bool isAuthenticated;
  final bool isError;

  const AppInitializationState({
    this.isLoading = false,
    this.isAuthenticated = false,
    this.isError = false,
  });

  AppInitializationState copyWith({
    bool? isLoading,
    bool? isAuthenticated,
    bool? isError,
  }) {
    return AppInitializationState(
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isError: isError ?? this.isError,
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        isError,
        isAuthenticated,
      ];
}
