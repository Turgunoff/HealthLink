//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: bookings_screen.dart
//

import 'package:flutter/material.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookings'),
      ),
      body: Center(
        child: Text('This is the Bookings Screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.push(context, MaterialPageRoute(builder: (context) => BookingFormScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
