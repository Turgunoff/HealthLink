//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: home_screen.dart
//

import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:http/http.dart' as http;

import '../../../core/domain/entities/doctor.dart';
import '../../doctor_detail/presentation/doctor_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  // Inside your HomeScreen widget (or a suitable place)
  Future<List<Doctor>> fetchDoctors() async {
    final response =
        await http.get(Uri.parse('http://54.93.198.137:3000/doctors'));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((doctorData) => Doctor.fromJson(doctorData)).toList();
    } else {
      throw Exception('Failed to load doctors');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0), // Chiziqning balandligi
          child: Container(
            color: Colors.blue, // Chiziqning rangi
          ),
        ),
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.tr('location'),
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 4),
            const Row(
              children: [
                const Icon(
                  Iconsax.location,
                  size: 18,
                  color: Colors.blue,
                ),
                SizedBox(width: 4),
                Text(
                  'Tashkent, Uzbekistan',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Iconsax.arrow_square_down,
                  size: 18,
                  color: Colors.blue,
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all(const Color(0xFFF0EEEE)),
            ),
            highlightColor: Colors.grey.shade400,
            tooltip: context.tr('notifications'),
            onPressed: () {},
            icon: const Icon(Iconsax.notification_bing),
          ),
        ],
      ),
      body: FutureBuilder<List<Doctor>>(
        future: fetchDoctors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            List<Doctor> doctors = snapshot.data!;
            doctors.sort((a, b) {
              if (a.rating == null && b.rating == null) return 0;
              if (a.rating == null) return 1;
              if (b.rating == null) return -1;
              return b.rating!.compareTo(a.rating!);
            });
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final doctor = snapshot.data![index];
                return ListTile(
                  // Or a more customized widget
                  title: Text('${doctor.firstName} ${doctor.lastName}'),
                  subtitle: Text(doctor.specialization!),
                  onTap: () {
                    // Navigate to DoctorDetailScreen with the selected doctor's data
                    pushScreen(
                      context,
                      withNavBar: true,
                      screen: DoctorDetailScreen(doctor: doctor),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('No doctors found'));
          }
        },
      ),
    );
  }
}
