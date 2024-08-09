//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: bookings_screen.dart
//

import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../doctor_detail/presentation/doctor_detail_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            pushScreen(
              context,
              withNavBar: true,
              screen: const DoctorDetailScreen(),
            );
          },
          child: Text('doctor detail'),
        ),
      ),
    );
  }
}
