//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: light_theme.dart
//

import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: const Color(0xFFF6F7FB),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    backgroundColor: Colors.white,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Color(0xFFF6F7FB),
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
    onPrimary: Colors.white, // Asosiy rang ustidagi matn: oq
    onSecondary: Colors.black, // Qo'shimcha rang ustidagi matn: qora
    onSurface: Colors.black, // Asosiy matn rangi: qora
  ),
  cardTheme: const CardTheme(
    color: Colors.white, // Card rangi: oq
  ),
);
