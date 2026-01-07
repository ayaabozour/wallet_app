import 'package:flutter_riverpod/legacy.dart';
import 'auth_notifier.dart';
import '../state/auth_state.dart';

final authProvider =
    StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});
