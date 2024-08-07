//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: routes.dart
//



import 'package:health_link/features/home/presentation/home_screen.dart';
import 'package:health_link/features/splash/presentation/splash_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      path: '/',
      children: [
        AutoRoute(
          page: SplashScreen.page,
          path: 'search',
        ),
        AutoRoute(
          page: HomeScreen.page,
          path: 'home',
        ),

      ],
    ),
  ];
}