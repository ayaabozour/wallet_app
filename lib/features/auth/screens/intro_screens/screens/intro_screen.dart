import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app_project/features/auth/screens/intro_screens/components/intro_dot.dart';
import 'package:wallet_app_project/features/auth/screens/intro_screens/components/intro_page.dart';
import '../provider/intro_provider.dart';


class IntroScreen extends ConsumerWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(introProvider);
    final notifier = ref.read(introProvider.notifier);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: state.pages.length,
              onPageChanged: notifier.changePage,
              itemBuilder: (context, index) {
                return IntroPage(page: state.pages[index]);
              },
            ),
          ),

          IntroDots(
            currentIndex: state.currentIndex,
            length: state.pages.length,
          ),

          const SizedBox(height: 24),

          Padding(
            padding: const EdgeInsets.all(24),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (state.currentIndex == state.pages.length - 1) {
                  }
                },
                child: Text(
                  state.currentIndex == state.pages.length - 1
                      ? 'Get Started'
                      : 'Next',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
