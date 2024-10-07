import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart'; // Geolocator paketini qo'shing
import 'package:health_link/app/app.dart';
import 'package:permission_handler/permission_handler.dart'; // permission_handler paketini qo'shing
import 'package:iconsax/iconsax.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

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

  Future<String?> getLocationAddress(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String address = '${placemark.locality}, ${placemark.country}';
        return address;
      }
    } catch (e) {
      print('Xatolik yuz berdi: $e');
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 55,
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              child: Icon(
                Iconsax.location5,
                color: Theme.of(context).primaryColor,
                size: 48,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              'What is Your Location?',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50),
              child: Text(
                'We need to know your location in order to suggest nearby services.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.grey.shade700,
                    ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                textStyle: const TextStyle(fontSize: 16),
              ),
              onPressed: () async {
                // 1. Joylashuvga kirishga ruxsat so'rash
                var status = await Permission.location.request();
                if (status.isGranted) {
                  // 2. Joylashuvni avtomatik aniqlash
                  Position position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high);

                  // Joylashuv ma'lumotlarini konsolga chiqarish
                  print(
                      'Kenglik: ${position.latitude}, Uzunlik: ${position.longitude}');

                  // Qurilma ID'sini olish
                  String? deviceId = await getDeviceId();
                  if (deviceId != null) {
                    print('Qurilma ID: $deviceId');

                    // Joylashuv manzilini olish
                    String? address = await getLocationAddress(
                        position.latitude, position.longitude);
                    if (address != null) {
                      print('Manzil: $address');
                    } else {
                      print('Manzil olinmadi');
                    }

                    // Qurilma ma'lumotlarini serverga yuborish
                    try {
                      final response = await http.post(
                        Uri.parse(
                            'https://healthlink.uz/devices'), // API endpoint'i
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: jsonEncode(<String, dynamic>{
                          'device_id': deviceId,
                          'latitude': position.latitude,
                          'longitude': position.longitude,
                          'address': address,
                        }),
                      );

                      if (response.statusCode == 201) {
                        // So'rov muvaffaqiyatli bajarildi
                        print('Qurilma ma\'lumotlari serverga yuborildi');
                        // 3. HomeScreen'ga o'tish
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const App()));
                      } else {
                        // Xatolik yuz berdi
                        print('Xatolik yuz berdi: ${response.statusCode}');
                      }
                    } catch (e) {
                      // Istisno yuz berdi
                      print('Xatolik yuz berdi: $e');
                    }
                  } else {
                    print('Qurilma ID olinmadi');
                  }
                } else {
                  // Ruxsat berilmasa, foydalanuvchiga xabar berish
                  // ...
                }
              },
              child: Text(
                'Allow Location Access',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Joylashuvni qo'lda kiritish ekraniga o'tish
              },
              child: Text(
                'Enter Location Manually',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
