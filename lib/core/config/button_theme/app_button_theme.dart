import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app_project/core/config/color/color_manager.dart';
import 'package:wallet_app_project/core/config/size/app_size.dart';
import 'package:wallet_app_project/core/config/text_theme/text_font_size.dart';
import 'package:wallet_app_project/core/config/text_theme/text_manager.dart';

class AppButtonTheme {
  AppButtonTheme._();
  static AppButtonTheme instance = AppButtonTheme._();

  ElevatedButtonThemeData get elevatedButtonStyle => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColorManager.instance.transparent,
      foregroundColor: ColorManager.instance.white,
      side: BorderSide.none,
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.r8),
      ),
      minimumSize: const Size(double.infinity, 48),
      textStyle: TextStyle(
        fontFamily: GoogleFonts.robotoSerif().fontFamily,
        color: ColorManager.instance.white,
        fontSize: TextFontSize.fontSize16,
        fontWeight: FontWeight.bold,
      ),
    ),
  );

  OutlinedButtonThemeData get outlinedButtonStyle => OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: ColorManager.instance.transparent,
      side: BorderSide(color: ColorManager.instance.white, width: 0.86),
      elevation: 0,
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.r10),
      ),
      minimumSize: Size(double.infinity, AppSize.h44),
      textStyle: TextManager.headline5.copyWith(
        color: ColorManager.instance.white,
      ),
    ),
  );

  ButtonStyle outlinedButtonTheme({Color? textColor, Color? borderColor}) =>
      OutlinedButton.styleFrom(
        backgroundColor: textColor ?? ColorManager.instance.white,
        disabledBackgroundColor: ColorManager.instance.whitePercentage50,
        elevation: 0,
        side: BorderSide(
          color: borderColor ?? ColorManager.instance.white,
          width: 0.5,
        ),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.circular(AppSize.r8),
          side: BorderSide(color: borderColor ?? ColorManager.instance.white),
        ),
        minimumSize: Size(double.infinity, AppSize.h44),
        textStyle: TextStyle(
          fontSize: TextFontSize.fontSizeAppSize.r8,
          fontFamily: GoogleFonts.robotoSerif().fontFamily,
        ),
      );

  TextButtonThemeData get textButtonStyle => TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: ColorManager.instance.primaryColor,
      backgroundColor: ColorManager.instance.transparent,
      textStyle: TextStyle(
        fontFamily: GoogleFonts.robotoSerif().fontFamily,
        color: ColorManager.instance.black,
        fontSize: TextFontSize.fontSize16,
      ),
    ),
  );
}
