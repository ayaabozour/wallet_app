import 'package:flutter_riverpod/legacy.dart';
import 'package:wallet_app_project/features/auth/screens/intro_screens/model/intro_model.dart';

final introProvider =
    StateNotifierProvider<IntroNotifier, IntroState>((ref) {
  return IntroNotifier();
});

class IntroNotifier extends StateNotifier<IntroState> {
  IntroNotifier()
      : super(
          IntroState(
            currentIndex: 0,
            pages: const [
              IntroModel(
                title: 'Welcome to Wallet App',
                description:
                    'Manage your money, invoices, and payments easily.',
                image: 'assets/images/hand.png',
              ),
              IntroModel(
                title: 'Scan & Receive Payments',
                description:
                    'Receive money instantly using secure QR codes.',
                image: 'assets/images/cashRoll.png',
              ),
              IntroModel(
                title: 'Track Expenses',
                description:
                    'View all purchases, invoices, and wallet history.',
                image: 'assets/images/chas.png',
              ),
            ],
          ),
        );

  void changePage(int index) {
    state = state.copyWith(currentIndex: index);
  }
}

class IntroState {
  final int currentIndex;
  final List<IntroModel> pages;

  const IntroState({
    required this.currentIndex,
    required this.pages,
  });

  IntroState copyWith({
    int? currentIndex,
    List<IntroModel>? pages,
  }) {
    return IntroState(
      currentIndex: currentIndex ?? this.currentIndex,
      pages: pages ?? this.pages,
    );
  }
}
