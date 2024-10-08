import 'dart:convert';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart'; // Geolocator paketini qo'shing
import 'package:health_link/app/app.dart';
import 'package:health_link/features/location/logic/bloc/location_bloc.dart';
import 'package:permission_handler/permission_handler.dart'; // permission_handler paketini qo'shing
import 'package:iconsax/iconsax.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocationBloc, LocationState>(
      listener: (context, state) {
        if (state is LocationSuccess) {
          // Muvaffaqiyatli holatda AppScreen'ga o'tish
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => const App()));
        } else if (state is LocationFailure) {
          // Xatolik holatida foydalanuvchiga xabar berish
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
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
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Text(
                      'We need to know your location in order to suggest nearby services.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey.shade700,
                          ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      context.read<LocationBloc>().add(GetLocationEvent());
                    },
                    child: Container(
                      height: 55,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 60, vertical: 15),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: BlocBuilder<LocationBloc, LocationState>(
                        // BlocBuilder ichida
                        builder: (context, state) {
                          return state is LocationLoading
                              ? CupertinoActivityIndicator(color: Colors.white)
                              : Text(
                                  'Allow Location Access',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: Colors.white),
                                );
                        },
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
          ),
        );
      },
    );
  }
}
