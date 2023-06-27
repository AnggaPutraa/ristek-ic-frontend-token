import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ic_jwt/core/constants/preferences_keys.dart';
import 'package:ic_jwt/features/main/data/repositories/main_repository.dart';
import 'package:ic_jwt/services/shared_preference_service.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/posts_model.dart';

part 'main_state.dart';

@injectable
class MainCubit extends Cubit<MainState> {
  final MainRepository _repository = MainRepository();
  MainCubit() : super(const MainState());
  void init() async {
    state.copyWith(
      isLoading: true,
    );
    await Future.delayed(const Duration(seconds: 3), () {});
    final email = SharedPreferencesService.getString(PreferencesKeys.email);
    final fullName =
        SharedPreferencesService.getString(PreferencesKeys.fullName);
    if (email == null || fullName == null) {
      emit(
        state.copyWith(
          isLoading: false,
        ),
      );
    } else {
      emit(
        state.copyWith(
          isLoading: false,
          isAuthenticated: true,
          email: email,
          fullName: fullName,
        ),
      );
    }
  }

  void getPosts() async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );

    final resp = await _repository.getPosts();

    emit(
      state.copyWith(
        isLoading: false,
        postsModel: resp.data,
      ),
    );
  }

  void clearPosts() {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    emit(
      state.copyWith(
        isLoading: false,
        postsModel: null,
      ),
    );
  }

  void signOut() async {
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    try {
      await SharedPreferencesService.removeCreds();
      emit(
        state.copyWith(
          isAuthenticated: false,
          isSuccessedSignOut: true,
          isLoading: false,
        ),
      );
    } catch (_) {
      emit(
        state.copyWith(
          isAuthenticated: false,
          isError: true,
          isLoading: false,
        ),
      );
    }
  }
}
