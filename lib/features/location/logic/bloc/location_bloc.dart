import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

import 'dart:convert';
import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';

part 'location_event.dart';
part 'location_state.dart';

// LocationBloc
class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    on<GetLocationEvent>(_handleGetLocationEvent);
  }

  Future<void> _handleGetLocationEvent(
      GetLocationEvent event, Emitter<LocationState> emit) async {
    emit(LocationLoading());

    // 1. Joylashuvga kirishga ruxsat so'rash
    var status = await Permission.location.request();
    if (status.isGranted) {
      try {
        // 2. Joylashuvni avtomatik aniqlash
        Position position = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);

        // Joylashuv ma'lumotlarini konsolga chiqarish
        print('Kenglik: ${position.latitude}, Uzunlik: ${position.longitude}');

        // Qurilma ID'sini olish
        String? deviceId = await _getDeviceId();
        if (deviceId != null) {
          print('Qurilma ID: $deviceId');

          // Joylashuv manzilini olish
          String? address =
              await _getLocationAddress(position.latitude, position.longitude);
          if (address != null) {
            print('Manzil: $address');

            // Qurilma ma'lumotlarini serverga yuborish
            try {
              final response = await http.post(
                Uri.parse('https://healthlink.uz/devices'),
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

              if (response.statusCode == 200 || response.statusCode == 201) {
                // So'rov muvaffaqiyatli bajarildi
                print('Qurilma ma\'lumotlari serverga yuborildi');

                emit(LocationSuccess(
                    address: address, deviceId: deviceId, position: position));
              } else {
                // Xatolik yuz berdi
                final responseData = jsonDecode(response.body);
                final errorMessage =
                    responseData['message'] ?? 'Noma\'lum xatolik';
                emit(LocationFailure(
                    error: 'Serverda xatolik yuz berdi: $errorMessage'));
              }
            } catch (e) {
              // Istisno yuz berdi
              emit(LocationFailure(error: 'Xatolik yuz berdi: $e'));
            }
          } else {
            emit(LocationFailure(error: 'Manzil olinmadi'));
          }
        } else {
          emit(LocationFailure(error: 'Qurilma ID olinmadi'));
        }
      } on PermissionDeniedException catch (e) {
        emit(LocationFailure(error: 'Joylashuvga ruxsat berilmadi: $e'));
      } catch (e) {
        emit(LocationFailure(error: 'Xatolik yuz berdi: $e'));
      }
    } else {
      emit(LocationFailure(error: 'Joylashuvga ruxsat berilmadi'));
    }
  }

  // Qurilma ID'sini olish funksiyasi
  Future<String?> _getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor;
    }
    return null;
  }

  Future<String?> _getLocationAddress(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      if (placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String address =
            '${placemark.street}, ${placemark.locality}, ${placemark.country}';
        return address;
      }
    } catch (e) {
      print('Xatolik yuz berdi: $e');
    }
    return null;
  }
}
