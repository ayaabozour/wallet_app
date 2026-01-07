import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:wallet_app_project/core/network/constance_network/api_endpoints.dart';
import 'package:wallet_app_project/core/network/providers/dio_provider.dart';
import 'package:wallet_app_project/core/network/providers/header_provider.dart';
import 'package:wallet_app_project/features/auth/state/auth_state.dart';
import '../../../core/network/token_types.dart';
import '../../../core/services/shared_prefs.dart';
import '../../../core/network/dio_manager/dio_manager.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this.ref) : super(const AuthState());

  final Ref ref;

  DioManager get _dio => ref.read(dioProvider);
  HeaderBuilder get _headers => ref.read(headerProvider);

  Future<void> checkAuth() async {
    final token = SharedPrefs.instance.getToken();

    if (token.isNotEmpty) {
      state = state.copyWith(status: AuthStatus.authenticated);
    } else {
      state = state.copyWith(status: AuthStatus.unauthenticated);
    }
  }

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      final response = await _dio.dioPost(
        url: ApiEndpoints.login,
        body: {
          "email": email,
          "password": password,
        },
        header: _headers.build(TokenType.contentType),
      );

      if (response.statusCode == 200) {
        final token = response.data['token'];

        SharedPrefs.instance.setToken(token: token);

        state = state.copyWith(
          isLoading: false,
          status: AuthStatus.authenticated,
        );
        return true;
      } else {
        state = state.copyWith(
          isLoading: false,
          error: response.data['message'],
        );
        return false;
      }
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
      return false;
    }
  }

  Future<void> logout() async {
    state = state.copyWith(isLoading: true);

    try {
      await _dio.dioPost(
        url: ApiEndpoints.logout,
        header: _headers.build(TokenType.authorization),
      );
    } catch (_) {}

    SharedPrefs.instance.clearToken();

    state = state.copyWith(
      isLoading: false,
      status: AuthStatus.unauthenticated,
    );
  }
}
