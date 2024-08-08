//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: splash_screen.dart
//

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_link/features/widgets/bottom_nav_bar.dart';

import '../../home/presentation/home_screen.dart';

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
    Navigator.pushReplacementNamed(context, '/home'); // MainScreen ga o'tish
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
