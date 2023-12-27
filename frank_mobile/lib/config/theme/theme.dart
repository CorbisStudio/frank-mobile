import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class AppColors {
  // lightPrimaryOne Color Swatch
  static const Color lightPrimaryOne = Color(0xffe73836);
  // lightSecondary Color Swatch
  static const Color lightSecondary = Color(0xff2e95d3);
  // lightAccent Color Swatch
  static const Color lightAccent = Color(0xfff6a547);
  // lightOnSurface Color Swatch
  static const Color lightOnSurface = Color(0xff000000);
  // lightSurface Color Swatch
  static const Color lightSurface = Color(0xffffffff);
  // lightSurfaceTint Color Swatch
  static const Color lightSurfaceTint = Color(0xfff2f2f2);
  // lightOutline Color Swatch
  static const Color lightOutline = Color(0x33000000);
  // lightComponentScrim Color Swatch
  static const Color lightComponentScrim = Color(0xb3000000);
  // lightExampleGradient Color Swatch
  static const List<Color> lightExampleGradient = <Color>[
    Color(0xffe73836),
    Color(0xfff6a547),
  ];
  // darkPrimary Color Swatch
  static const Color darkPrimary = Color(0xffe73836);
  // darkSecondary Color Swatch
  static const Color darkSecondary = Color(0xff2e95d3);
  // darkAccent Color Swatch
  static const Color darkAccent = Color(0xfff6a547);
  // darkSurface Color Swatch
  static const Color darkSurface = Color(0xff000000);
  // darkSurfaceTint Color Swatch
  static const Color darkSurfaceTint = Color(0xff1a1a1a);
  // darkOnSurface Color Swatch
  static const Color darkOnSurface = Color(0xffffffff);
  // darkOutline Color Swatch
  static const Color darkOutline = Color(0x33ffffff);
  // darkComponentScrim Color Swatch
  static const Color darkComponentScrim = Color(0x33ffffff);
  // darkExampleGradient Color Swatch
  static const List<Color> darkExampleGradient = <Color>[
    Color(0xffe73836),
    Color(0xfff6a547),
  ];
}


abstract class AppTextStyle {
  // headerH1 Text Style
  static const TextStyle headerH1 = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w700, // bold
    height: 1.17, // 56px 
    letterSpacing: -0.5,
    fontFamily: 'Poppins',
  );
  // headerH2 Text Style
  static const TextStyle headerH2 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700, // bold
    height: 1.25, // 40px 
    letterSpacing: -0.5,
    fontFamily: 'Poppins',
  );
  // headerH3 Text Style
  static const TextStyle headerH3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700, // bold
    height: 1.33, // 32px 
    letterSpacing: -0.5,
    fontFamily: 'Poppins',
  );
  // bodyLarge Text Style
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w400, // regular
    height: 1.4, // 28px 
    fontFamily: 'Poppins',
  );
  // bodyMedium Text Style
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400, // regular
    height: 1.5, // 24px 
    fontFamily: 'Poppins',
  );
  // bodyMediumBold Text Style
  static const TextStyle bodyMediumBold = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700, // bold
    height: 1.5, // 24px 
    fontFamily: 'Poppins',
  );
  // bodyMediumLink Text Style
  static const TextStyle bodyMediumLink = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400, // regular
    height: 1.5, // 24px 
    decoration: TextDecoration.underline,
    fontFamily: 'Poppins',
  );
  // bodyMediumMono Text Style
  static const TextStyle bodyMediumMono = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400, // regular
    height: 1.5, // 24px 
    fontFamily: 'Roboto Mono',
  );
  // bodyMediumItalic Text Style
  static const TextStyle bodyMediumItalic = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500, // medium
    fontStyle: FontStyle.italic,
    height: 1.5, // 24px 
    fontFamily: 'Inter',
  );
  // buttonMedium Text Style
  static const TextStyle buttonMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700, // bold
    height: 1.33, // 23.94px 
    letterSpacing: 2,
    fontFamily: 'Poppins',
  );
}