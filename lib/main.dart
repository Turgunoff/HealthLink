import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_link/app/app.dart';
import 'package:health_link/app/config/theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/home/logic/home_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter(); // Hive'ni ishga tushiramiz

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ),
  );
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ru'), Locale('uz')],
      path: 'assets/translations', // <-- json fayllar joylashgan papka
      fallbackLocale: const Locale('en'),
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
  final _themeBox = Hive.box('theme'); // Hive box'ni ochamiz

  @override
  void initState() {
    super.initState();
    // Agar oldin tema saqlanmagan bo'lsa, light tema sifatida o'rnatamiz
    if (_themeBox.get('themeMode') == null) {
      _themeBox.put('themeMode', ThemeMode.light);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
      ],
      child: ValueListenableBuilder<Box>(
          // Hive box'ni kuzatamiz
          valueListenable: _themeBox.listenable(),
          builder: (context, box, _) {
            final themeMode =
                box.get('themeMode', defaultValue: ThemeMode.light);
            return MaterialApp(
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,

              locale: context.locale,
              home: const App(),
              debugShowCheckedModeBanner: false,
              themeMode: themeMode, // ThemeMode'ni o'rnatamiz
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
            );
          }),
    );
  }
}
