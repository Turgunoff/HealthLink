//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: routes.dart
//

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_link/features/widgets/bottom_nav_bar.dart';

import '../../features/home/presentation/home_screen.dart';
import '../../features/splash/presentation/splash_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/', // Splash screenni boshlang'ich nuqta qilish
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreen(),
    ),
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return MainLayout(child: child); // MainLayout'ni ishlatish
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/home',
          builder: (BuildContext context, GoRouterState state) =>
              const HomeScreen(),
        ),
        // ... (boshqa ekranlar uchun route'lar)
      ],
    ),
  ],
);

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child, // Bu yerda child vidjeti ko'rsatiladi
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
