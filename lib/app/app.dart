//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: app.dart
//

import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../features/bookings/presentation/bookings_screen.dart';
import '../features/chat/presentation/chat_screen.dart';
import '../features/category/presentation/category_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/profile/presentation/profile_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  List<PersistentTabConfig> _tabs() => [
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: ItemConfig(
            icon: const Icon(Iconsax.home_outline),
            title: "Home",
          ),
        ),
        //exploreScreen(),
        PersistentTabConfig(
          screen: const CategoryScreen(),
          item: ItemConfig(
            icon: const Icon(Iconsax.category_outline),
            title: "Category",
          ),
        ),
        //bookingScreen(),
        PersistentTabConfig(
          screen: const BookingsScreen(),
          item: ItemConfig(
            icon: const Icon(Iconsax.calendar_outline),
            title: "Booking",
          ),
        ),
        //chatScreen(),
        PersistentTabConfig(
          screen: const ChatScreen(),
          item: ItemConfig(
            icon: const Icon(Iconsax.message_outline),
            title: "Chat",
          ),
        ),
        // settingsScreen(),
        PersistentTabConfig(
          screen: const ProfileScreen(),
          item: ItemConfig(
            icon: const Icon(Iconsax.profile_circle_outline),
            title: "Profile",
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) => PersistentTabView(
        tabs: _tabs(),
        navBarBuilder: (navBarConfig) => Style4BottomNavBar(
          navBarDecoration: NavBarDecoration(
            // border:
            //     Border(top: BorderSide(width: 1, color: Colors.grey.shade200)),
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor!,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
          ),
          itemAnimationProperties: const ItemAnimation(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 200),
          ),
          navBarConfig: navBarConfig,
        ),
      );
}
