//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: bookings_screen.dart
//

import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExploreScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ExploreScreen'),
          ],
        ),
      ),
    );
  }
}
