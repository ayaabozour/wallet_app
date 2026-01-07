import 'package:flutter_riverpod/legacy.dart';
import 'package:wallet_app_project/core/services/shared_prefs.dart';

class AppState {
  final bool isFirstOpen;
  final bool isLogin;
  final bool splashDone;

  AppState({
    required this.isFirstOpen,
    required this.isLogin,
    required this.splashDone,
  });

  AppState copyWith({bool? isFirstOpen, bool? isLogin, bool? splashDone}) {
    return AppState(
      isFirstOpen: isFirstOpen ?? this.isFirstOpen,
      isLogin: isLogin ?? this.isLogin,
      splashDone: splashDone ?? this.splashDone,
    );
  }
}

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier()
    : super(
        AppState(
          isFirstOpen: SharedPrefs.instance.getIsFirstOpen(),
          isLogin: SharedPrefs.instance.getIsLogin(),
          splashDone: false,
        ),
      );

  void finishSplash() {
    state = state.copyWith(splashDone: true);
  }

  Future<void> setFirstOpenFalse() async {
    SharedPrefs.instance.setIsFirstOpen(isFirstOpen: false);
    state = state.copyWith(isFirstOpen: false);
  }

  Future<void> setLogin(bool value) async {
    SharedPrefs.instance.setIsLogin(isLogin: value);
    state = state.copyWith(isLogin: value);
  }
}

final appStateProvider = StateNotifierProvider<AppStateNotifier, AppState>((
  ref,
) {
  return AppStateNotifier();
});
