import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app_project/core/config/color/color_manager.dart';
import 'package:wallet_app_project/core/config/text_theme/text_font_size.dart';

abstract class TextManager {
  static TextStyle get inputTheme => TextStyle(
    fontFamily: GoogleFonts.robotoSerif().fontFamily,
    color: ColorManager.instance.black,
    fontWeight: FontWeight.w400,
  );

  static TextStyle get headline1 => TextStyle(
    fontFamily: GoogleFonts.robotoSerif().fontFamily,
    color: ColorManager.instance.textColor,
    fontWeight: FontWeight.normal,
    fontSize: TextFontSize.fontSize34,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get headline2 => TextStyle(
    fontFamily: GoogleFonts.robotoSerif().fontFamily,
    color: ColorManager.instance.textColor,
    fontWeight: FontWeight.normal,
    fontSize: TextFontSize.fontSize28,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get headline3 => TextStyle(
    fontFamily: GoogleFonts.robotoSerif().fontFamily,
    color: ColorManager.instance.textColor,
    fontWeight: FontWeight.normal,
    fontSize: TextFontSize.fontSize24,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get headline4 => TextStyle(
    fontFamily: GoogleFonts.robotoSerif().fontFamily,
    color: ColorManager.instance.textColor,
    fontWeight: FontWeight.normal,
    fontSize: TextFontSize.fontSize20,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get headline5 => TextStyle(
    fontFamily: GoogleFonts.robotoSerif().fontFamily,
    color: ColorManager.instance.textColor,
    fontWeight: FontWeight.normal,
    fontSize: TextFontSize.fontSize16,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get headline6 => TextStyle(
    fontFamily: GoogleFonts.robotoSerif().fontFamily,
    color: ColorManager.instance.textColor,
    fontWeight: FontWeight.normal,
    fontSize: TextFontSize.fontSizeAppSize.r8,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get subTitle1 => TextStyle(
    fontFamily: GoogleFonts.robotoSerif().fontFamily,
    color: ColorManager.instance.textColor,
    fontWeight: FontWeight.normal,
    fontSize: TextFontSize.fontSize17,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get subTitle2 => TextStyle(
    fontFamily: GoogleFonts.robotoSerif().fontFamily,
    color: ColorManager.instance.textBodyColor,
    fontWeight: FontWeight.normal,
    fontSize: TextFontSize.fontSizeAppSize.r8,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get textBody1 => TextStyle(
    fontFamily: GoogleFonts.robotoSerif().fontFamily,
    color: ColorManager.instance.textBodyColor,
    fontWeight: FontWeight.normal,
    fontSize: TextFontSize.fontSize16,
    overflow: TextOverflow.ellipsis,
  );

  static TextStyle get textBody2 => TextStyle(
    fontFamily: GoogleFonts.robotoSerif().fontFamily,
    color: ColorManager.instance.textBodyColor,
    fontWeight: FontWeight.normal,
    fontSize: TextFontSize.fontSize14,
    overflow: TextOverflow.ellipsis,
  );
}
