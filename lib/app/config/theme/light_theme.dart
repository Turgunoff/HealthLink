//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: light_theme.dart
//

import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white, // Orqa fon rangi: oq
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  colorScheme: const ColorScheme.light(
    primary: Color(0xFF0864FC), // Asosiy rang: 0864fc
    secondary: Color(0xFFE0ECFC), // Qo'shimcha rang: e0ecfc
    surface: Colors.white,
    onPrimary: Colors.white, // Asosiy rang ustidagi matn: oq
    onSecondary: Colors.black, // Qo'shimcha rang ustidagi matn: qora
    onSurface: Colors.black, // Asosiy matn rangi: qora
  ),
  textTheme: TextTheme(
    displayLarge: const TextStyle(
      color: Colors.black,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: const TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    displaySmall: const TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontWeight: FontWeight.bold,
    ),
    headlineMedium: const TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodyLarge: const TextStyle(
      color: Colors.black,
      fontSize: 14,
    ),
    bodyMedium: TextStyle(
      color: Colors.grey.shade600, // Qo'shimcha matn rangi: ochroq qora
      fontSize: 12,
    ),
  ),
);
