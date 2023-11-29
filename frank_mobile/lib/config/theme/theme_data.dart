import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Colors.deepOrange,
    onPrimary: Colors.white,
    secondary: Colors.brown,
    onSecondary: Colors.white,
    error: Colors.red.shade600,
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.orange.shade500,
    surface: Colors.white,
    onSurface: Colors.blueGrey.shade800,
  ),
  brightness: Brightness.light,
  primaryColor: const Color(0xFFFF6537),
  textTheme: GoogleFonts.openSansTextTheme(),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
  brightness: Brightness.dark,
  primaryColor: const Color(0xFFFF6537),
);
