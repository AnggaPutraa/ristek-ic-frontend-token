import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

import '../../../../services/shared_preference_service.dart';

part 'app_initialization_state.dart';

@injectable
class AppInitializationCubit extends Cubit<AppInitializationState> {
  AppInitializationCubit() : super(const AppInitializationState());

  void init() async {
    state.copyWith(
      isLoading: true,
    );
    await Future.delayed(const Duration(seconds: 3), () {});
    final isTokenValid = _isTokenValid(SharedPreferencesService.getToken());
    if (isTokenValid) {
      emit(
        state.copyWith(
          isLoading: false,
          isAuthenticated: true,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
    }
  }

  bool _isTokenValid(String? token) {
    if (token == null) return false;
    return true;
  }
}
