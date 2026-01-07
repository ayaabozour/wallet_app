import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app_project/core/router/router_helpers.dart';
import 'package:wallet_app_project/features/auth/screens/intro_screens/provider/app_state_provider.dart';
import 'package:wallet_app_project/features/auth/screens/intro_screens/screens/intro_screen.dart';
import 'package:wallet_app_project/features/auth/screens/intro_screens/screens/splash_screen.dart';
import 'package:wallet_app_project/features/auth/screens/login_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final appState = ref.watch(appStateProvider);

  return GoRouter(
    initialLocation: '/intro',
    refreshListenable: GoRouterRefreshStream(
      ref.watch(appStateProvider.notifier).stream,
    ),
    redirect: (context, state) {
      if (!appState.splashDone) {
        return '/splash';
      }
      if (appState.isFirstOpen) {
        return '/intro';
      }
      if (!appState.isLogin) {
        return '/login';
      }
      return '/home';
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(path: '/intro', builder: (context, state) => const IntroScreen()),
      GoRoute(path: "/login", builder: (context, state) => const LoginScreen()),
    ],
  );
});
