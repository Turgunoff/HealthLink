//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: dark_theme.dart
//

import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  colorScheme: const ColorScheme.dark(
    primary: Colors.blue,
    secondary: Colors.blue,
    surface: Colors.black,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.white,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: TextStyle(
      color: Colors.white,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 14,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 12,
    ),
  ),
);
