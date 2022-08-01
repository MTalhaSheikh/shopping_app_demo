import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'appearance.dart';

class LightAppearance extends Appearance {
  static const teal = Colors.teal;

  @override
  Color boldRedColor = const Color(0xff8e0f13);

  @override
  ThemeData get appTheme {
    return ThemeData(
      brightness: Brightness.light,
      //fontFamily: 'GothamPro',
      canvasColor: const Color(0xFFF6F8F9),
      scaffoldBackgroundColor: const Color(0xFFF6F8F9),
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 1.0,
        iconTheme: IconThemeData(
          size: 28.0,
          color: teal,
        ),
        actionsIconTheme: IconThemeData(
          color: teal,
          size: 28.0,
        ),
      ),
      textTheme: const TextTheme(
        subtitle1: TextStyle(
          color: Color(0xFF000000),
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
        subtitle2: TextStyle(
          color: Color(0xFF151622),
          fontWeight: FontWeight.w400,
          fontSize: 16.0,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        contentPadding: EdgeInsets.only(
          left: 16.0,
          right: 16.0,
        ),
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        labelStyle: TextStyle(
          height: 0.8,
          color: Color(0xFF8E93A3),
          fontSize: 12.0,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          color: Color(0xFF8E93A3),
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      iconTheme: const IconThemeData(
        color: Color(0xFF8E93A3),
        size: 20.0,
      ),
      primaryIconTheme: const IconThemeData(
        color: Color(0xFF8E93A3),
        size: 20.0,
      ),
    );
  }

  @override
  TextStyle get primaryButtonTitleStyle => GoogleFonts.lato(
    fontWeight: FontWeight.w800,
    fontSize: 15,
    color: Colors.black87,
  );

  @override
  BoxDecoration get dropDownDecoration => BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(0.5),
    boxShadow: [
      BoxShadow(
        color: Colors.black12.withOpacity(0.1),
        spreadRadius: 5,
        blurRadius: 7,
        offset: const Offset(0, 3), // changes position of shadow
      ),
    ],
  );

  @override
  TextStyle get heading1TextStyle => GoogleFonts.lato(
    fontWeight: FontWeight.w900,
    fontSize: 20,
    color: Colors.black87,
  );

  @override
  TextStyle get heading2TextStyle => GoogleFonts.lato(
    fontWeight: FontWeight.w900,
    fontSize: 18,
    color: Colors.black87,
  );
}
