import 'package:flutter/material.dart';
import 'package:wallet_app_project/features/intro_screens/model/intro_model.dart';

class IntroPage extends StatelessWidget {
  final IntroModel page;

  const IntroPage({super.key, required this.page});

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 500),
      transitionBuilder: (child, animation) {
        return FadeTransition(
          opacity: animation,
          child: ScaleTransition(
            scale: animation,
            child: child,
          ),
        );
      },
      child: Padding(
        key: ValueKey(page.title), 
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              page.image,
              height: 250,
            ),
            const SizedBox(height: 40),
            Text(
              page.title,
              style: Theme.of(context).textTheme.headlineSmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              page.description,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
