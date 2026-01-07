import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app_project/core/config/size/app_size.dart';
import 'package:wallet_app_project/features/intro_screens/provider/app_state_provider.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          "assets/logoOnly.png",
          width: getSize(context).width * 0.5,
        )
            .animate()
            .fadeIn(duration: 600.ms)
            .scale(delay: 200.ms)
            .then(delay: 800.ms)
            .callback(
              callback: (_) {
                ref.read(appStateProvider.notifier).finishSplash();
              },
            ),
      ),
    );
  }
}