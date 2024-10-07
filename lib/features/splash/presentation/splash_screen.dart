//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: splash_screen.dart
//

import 'package:flutter/material.dart';
import 'package:health_link/app/app.dart';
import 'package:health_link/features/location/presentation/location_screen.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
    // _navigateToHome(); // initState ichida chaqirish
  }

  Future<void> _navigateToNextScreen() async {
    await Future.delayed(const Duration(milliseconds: 2000)); // 2 soniya kutish

    // Qurilma ID'sini olish
    String? deviceId = await getDeviceId();

    if (deviceId != null) {
      print('Qurilma ID\'si: $deviceId');
      try {
        final response = await http
            .get(Uri.parse('https://healthlink.uz/devices/$deviceId'));

        if (response.statusCode == 200) {
          // Qurilma topildi, AppScreen'ga o'tish
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const App()));
        } else {
          // Qurilma topilmadi, LocationScreen'ga o'tish
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LocationScreen()));
        }
      } catch (e) {
        // Xatolikni qayta ishlash
        print('Xatolik yuz berdi: $e');
        // Xatolik holatida nima qilish kerakligini aniqlang (masalan, LocationScreen'ga o'tish yoki xato xabarini ko'rsatish)
      }
    } else {
      // Qurilma ID'sini olishda xatolik yuz berdi
      print('Qurilma ID\'sini olishda xatolik yuz berdi');
      // Xatolik holatida nima qilish kerakligini aniqlang
    }
  }

  // Qurilma ID'sini olish funksiyasi
  Future<String?> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
      // ANDROID_ID
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor; // UUID for Vendor
    }
    return null;
  }

  // _navigateToHome() async {
  //   await Future.delayed(const Duration(seconds: 2)); // 2 soniya kutish
  //   Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(
  //           builder: (context) => const App())); // MainScreen ga o'tish
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Splash Screen'),
      ),
    );
  }
}
