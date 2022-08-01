import 'package:flutter/material.dart';

abstract class Appearance {
  ThemeData get appTheme;

  TextStyle get primaryButtonTitleStyle;

  TextStyle get heading1TextStyle;

  TextStyle get heading2TextStyle;

  Color get boldRedColor;

  BoxDecoration get dropDownDecoration;
}
