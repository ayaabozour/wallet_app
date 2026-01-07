enum AuthStatus {
  firstOpen,
  authenticated,
  unauthenticated,
}

class AuthState {
  final bool isLoading;
  final AuthStatus status;
  final String? error;

  const AuthState({
    this.isLoading = false,
    this.status = AuthStatus.firstOpen,
    this.error,
  });

  AuthState copyWith({
    bool? isLoading,
    AuthStatus? status,
    String? error,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      status: status ?? this.status,
      error: error,
    );
  }
}
