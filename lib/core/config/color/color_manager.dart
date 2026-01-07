import 'package:flutter/material.dart';

class ColorManager {
  final Color primaryColor = const Color(0xFF001e3b);

  final Color secondaryColor = const Color(0xFF4d8ea2);

  final Color white = const Color(0xFFFFFFFF);

  final black = const Color(0xFF000000);

  final Color transparent = const Color(0x00000000);

  final Color scaffoldColor = const Color(0xFFFCFCFC);

  final backgroundColor = const Color(0xFFF2F2F2);

  final backgroundColorDark = const Color(0xFF1A1A1A);

  final textBodyColorDark = const Color(0xFFBDBDBD);

  final textColor = const Color(0xFF000000);

  final LinearGradient gradientApp = const LinearGradient(
    colors: [Color(0xFF001e3b), Color(0xFF4d8ea2)],
  );

  final Color error = const Color(0xFFFF3030);

  final Color success = const Color(0xFF439E46);

  final Color grayText = const Color(0xFF919397);

  final Color textBodyColor = const Color(0xFF424242);

  final Color fillBorderColor = const Color(0xFF424242);

  final Color textFiledBorder = const Color(0xFFBABABA);

  final Color textBorderColor = const Color(0xFF707070);

  final Color filledTextFieldColor = const Color(0xFFF8F8F8);

  ColorManager._();

  static ColorManager instance = ColorManager._();

  get whitePercentage50 => null;
}
