import 'package:flutter/material.dart';

class FontConstant {
  FontConstant._();

  static const String fontFamily = 'Poppins';
  static const String fontFamilyGabriela = 'Gabriela';

  static TextStyle styleRegular({
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      color: color,
    );
  }
  static TextStyle styleMedium({
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      color: color,
    );
  }
  static TextStyle styleSemiBold({
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: color,
    );
  }
  static TextStyle styleBold({
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: FontWeight.w800,
      fontSize: fontSize,
      color: color,
    );
  }
   static TextStyle styleRegularGabriela({
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: fontFamilyGabriela,
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      color: color,
    );
  }
}
