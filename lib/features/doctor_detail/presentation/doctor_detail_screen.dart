//
// @Author: "Eldor Turgunov"
// @Date: 09.08.2024
// @File name: doctor_detail_screen
//

import 'package:flutter/material.dart';
import 'package:health_link/core/domain/entities/doctor.dart';

class DoctorDetailScreen extends StatelessWidget {
  final Doctor doctor;
  const DoctorDetailScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${doctor.firstName} ${doctor.lastName}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Specialization: ${doctor.specialization}'),
            // Text('Experience: ${doctor.experience} years'),
            Text('Rating: ${doctor.rating}'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}
