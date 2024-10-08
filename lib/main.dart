import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:health_link/app/config/theme/dark_theme.dart';
import 'package:health_link/app/config/theme/light_theme.dart';
import 'package:health_link/features/location/logic/bloc/location_bloc.dart';
import 'package:health_link/features/splash/presentation/splash_screen.dart';

import 'features/home/logic/home_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  // await Hive.initFlutter(); // Hive'ni ishga tushiramiz

  // Tizim temasini aniqlash
  var brightness = PlatformDispatcher.instance.platformBrightness;
  SystemUiOverlayStyle systemUiOverlayStyle;

  if (brightness == Brightness.dark) {
    // Dark theme uchun
    systemUiOverlayStyle = SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Colors.black,
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    );
  } else {
    // Light theme uchun
    systemUiOverlayStyle = SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Colors.white,
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    );
  }
  SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark.copyWith(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.black, // status bar color
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      systemNavigationBarColor: Colors.black, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ru'), Locale('uz')],
      path: 'assets/translations', // <-- json fayllar joylashgan papka
      fallbackLocale: const Locale('ru'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final _themeBox = Hive.box('theme'); // Hive box'ni ochamiz

  // @override
  // void initState() {
  //   super.initState();
  //   // Agar oldin tema saqlanmagan bo'lsa, light tema sifatida o'rnatamiz
  //   if (_themeBox.get('themeMode') == null) {
  //     _themeBox.put('themeMode', ThemeMode.light);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
        BlocProvider<LocationBloc>(create: (context) => LocationBloc()),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: lightTheme,
        darkTheme: darkTheme,
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,

        // themeMode: AppTheme.darkTheme, // ThemeMode'ni o'rnatamiz
        // theme: AppTheme.lightTheme,
        // darkTheme: AppTheme.darkTheme,
      ),
    );
  }
}
