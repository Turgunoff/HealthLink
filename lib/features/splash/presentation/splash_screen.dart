//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: splash_screen.dart
//

import 'package:flutter/material.dart';
import 'package:health_link/app/app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome(); // initState ichida chaqirish
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 2)); // 2 soniya kutish
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const App())); // MainScreen ga o'tish
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
