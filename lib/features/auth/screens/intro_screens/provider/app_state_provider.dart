import 'package:flutter_riverpod/legacy.dart';
import 'package:wallet_app_project/core/services/shared_prefs.dart';

final appStateProvider =
    StateNotifierProvider<AppStateNotifier, AppState>((ref) {
  return AppStateNotifier();
});

class AppState {
  final bool isFirstOpen;

  AppState({required this.isFirstOpen});

  AppState copyWith({bool? isFirstOpen}) {
    return AppState(isFirstOpen: isFirstOpen ?? this.isFirstOpen);
  }
}

class AppStateNotifier extends StateNotifier<AppState> {
  AppStateNotifier()
      : super(AppState(isFirstOpen: SharedPrefs.instance.getIsFirstOpen()));

  Future<void> setFirstOpenFalse() async {
    SharedPrefs.instance.setIsFirstOpen(isFirstOpen: false);
    state = state.copyWith(isFirstOpen: false);
  }
}