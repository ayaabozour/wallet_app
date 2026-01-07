import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app_project/features/auth/screens/intro_screens/components/intro_dot.dart';
import 'package:wallet_app_project/features/auth/screens/intro_screens/components/intro_page.dart';
import '../provider/intro_provider.dart';
import '../provider/app_state_provider.dart';
import 'package:go_router/go_router.dart';

class IntroScreen extends ConsumerWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(introProvider);
    final notifier = ref.read(introProvider.notifier);
    final appStateNotifier = ref.read(appStateProvider.notifier);

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            itemCount: state.pages.length,
            onPageChanged: notifier.changePage,
            itemBuilder: (context, index) {
              return IntroPage(page: state.pages[index]);
            },
          ),
          Positioned(
            top: 50,
            right: 24,
            child: TextButton(
              onPressed: () async {
                await appStateNotifier.setFirstOpenFalse();
                if(context.mounted){
                  context.go('/login'); 
                }
              },
              child: const Text(
                'Skip',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IntroDots(
                  currentIndex: state.currentIndex,
                  length: state.pages.length,
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (state.currentIndex == state.pages.length - 1) {
                          await appStateNotifier.setFirstOpenFalse();
                          if(context.mounted){
                             context.go('/login');
                          }
                         
                        } else {
                          notifier.changePage(state.currentIndex + 1);
                        }
                      },
                      child: Text(
                        state.currentIndex == state.pages.length - 1
                            ? 'Get Started'
                            : 'Next',
                        style:Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
