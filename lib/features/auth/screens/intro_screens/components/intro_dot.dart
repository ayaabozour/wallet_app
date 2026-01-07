import 'package:flutter/material.dart';

class IntroDots extends StatelessWidget {
  final int currentIndex;
  final int length;

  const IntroDots({
    super.key,
    required this.currentIndex,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          width: currentIndex == index ? 20 : 8,
          height: 8,
          decoration: BoxDecoration(
            color: currentIndex == index
                ? Theme.of(context).primaryColor
                : Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
