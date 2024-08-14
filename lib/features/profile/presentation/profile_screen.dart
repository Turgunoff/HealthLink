//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: bookings_screen.dart
//

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn = true;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: isLoggedIn ? _buildLoggedInProfile() : _buildLoggedOutProfile(),
    );
  }

  Widget _buildLoggedInProfile() {
    return SingleChildScrollView(
      // Scrollable qilish uchun
      child: Column(
        children: [
          const SizedBox(height: 20),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/user_avatar.png'),
            child: Align(
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 15,
                child: Icon(Icons.edit, color: Colors.blue),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Esther Howard',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          _buildProfileListTile('Your profile', Iconsax.profile_circle),
          Divider(
            thickness: 1,
            color: Colors.grey.shade100,
          ),
          _buildProfileListTile('Payment Methods', Iconsax.card),
          Divider(
            thickness: 1,
            color: Colors.grey.shade100,
          ),
          _buildProfileListTile('Favourite', Iconsax.heart),
          _buildProfileListTile('Settings', Iconsax.setting_2),
          _buildProfileListTile('Help Center', Iconsax.info_circle),
          _buildProfileListTile('Privacy Policy', Iconsax.lock),
          _buildProfileListTile('Log out', Iconsax.logout_1),
        ],
      ),
    );
  }

  Widget _buildLoggedOutProfile() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          // Tizimga kirish logikasini yozing
        },
        child: const Text('Log in'),
      ),
    );
  }

  Widget _buildProfileListTile(String title, IconData icon) {
    return GestureDetector(
      onTap: () {},
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16),
          elevation:0,
          shape: LinearBorder()
        ),
        onPressed: () {},
        child: Row(
          children: [
            Icon(icon, size: 24, color: Colors.blue),
            Text(title, style: TextStyle(fontSize: 16)),
            Spacer(),
            Icon(Iconsax.arrow_right_3, size: 24, color: Colors.blue),
          ],
        ),
        // contentPadding: EdgeInsets.symmetric(horizontal: 16),
        // visualDensity: VisualDensity.standard,
        // leading: Icon(icon, size: 24, color: Colors.blue),
        // title: Text(title, style: TextStyle(fontSize: 16)),
        // trailing: Icon(Iconsax.arrow_right_3, size: 24, color: Colors.blue),
        // onTap: () {
        //   // Har bir element bosilganda bajariladigan amalni yozing
        // },
      ),
    );
  }
}
