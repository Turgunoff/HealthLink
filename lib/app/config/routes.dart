//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: routes.dart
//
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_link/features/splash/presentation/splash_screen.dart';

import '../../features/home/presentation/home_screen.dart';
import '../../features/profile/presentation/profile_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case '/profile':
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: const Center(child: Text('ERROR')),
      );
    });
  }
}
