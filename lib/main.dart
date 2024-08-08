import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/config/routes.dart';
import 'features/home/logic/home_bloc.dart';
import 'features/splash/presentation/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
      ],
      child: MaterialApp(
        initialRoute: '/', // Boshlang'ich route nomi
        onGenerateRoute: RouteGenerator.generateRoute, // Route'larni generatsiya qilish uchun
        debugShowCheckedModeBanner: false,
        // Remove this line when releasing your app
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
