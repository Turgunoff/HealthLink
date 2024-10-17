//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: bookings_screen.dart
//

import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            centerTitle: true,
            surfaceTintColor: Colors.transparent,
            elevation: 4,
            shadowColor: Colors.grey.shade100,
            // backgroundColor: Colors.white,
            title: Text(
              "Kategoriyalar",
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
            ), // Text widgetga o'zgartirildi
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 16.0,
              bottom: 70.0,
              left: 16.0,
              right: 16.0,
            ),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: 0.9,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return CategoryItem(
                    icon: categories[index].icon,
                    name: categories[index].name,
                  );
                },
                childCount: categories.length,
                addAutomaticKeepAlives: true,
                addRepaintBoundaries: true,
                addSemanticIndexes: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String name;

  const CategoryItem({
    Key? key,
    required this.icon,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // Elementlarni vertikal markazlash
      children: [
        CircleAvatar(
          radius: 36,
          backgroundColor:
              Theme.of(context).colorScheme.secondary, // Doira fon rangi
          child: Icon(
            icon,
            color: Theme.of(context).colorScheme.primary, // Ikonka rangi
            size: 34,
          ),
        ),
        const SizedBox(height: 4.0), // Doira va matn orasidagi bo'shliq
        Text(
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          name,
          textAlign: TextAlign.center, // Matnni markazlash
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
}

// Kategoriyalar ro'yxati
final List<Category> categories = [
  Category(icon: Icons.zoom_out_rounded, name: 'Dentist'),
  Category(icon: Icons.favorite, name: 'Cardioloasdas as fas f as f asf'),
  Category(icon: Icons.zoom_out_rounded, name: 'Dentist sad as asf as fas f'),
  Category(icon: Icons.favorite, name: 'Cardiolo...'),
  Category(icon: Icons.zoom_out_rounded, name: 'Dentist'),
  Category(icon: Icons.favorite, name: 'Cardiolo...'),
  Category(icon: Icons.zoom_out_rounded, name: 'Dentist'),
  Category(icon: Icons.favorite, name: 'Cardiolo...'),
  Category(icon: Icons.zoom_out_rounded, name: 'Dentist'),
  Category(icon: Icons.favorite, name: 'Cardiolo...'),
  Category(icon: Icons.zoom_out_rounded, name: 'Dentist'),
  Category(icon: Icons.favorite, name: 'Cardiolo...'),
  Category(icon: Icons.zoom_out_rounded, name: 'Dentist'),
  Category(icon: Icons.favorite, name: 'Cardiolo...'),
  Category(icon: Icons.zoom_out_rounded, name: 'Dentist'),
  Category(icon: Icons.favorite, name: 'Cardioloasdas as fas f as f asf'),
  Category(icon: Icons.zoom_out_rounded, name: 'Dentist sad as asf as fas f'),
  Category(icon: Icons.favorite, name: 'Cardiolo...'),
  Category(icon: Icons.zoom_out_rounded, name: 'Dentist'),
  Category(icon: Icons.favorite, name: 'Cardiolo...'),
  Category(icon: Icons.zoom_out_rounded, name: 'Dentist'),
  Category(icon: Icons.favorite, name: 'Cardiolo...'),
  Category(icon: Icons.zoom_out_rounded, name: 'Dentist'),
  Category(icon: Icons.favorite, name: 'Cardiolo...'),
  Category(icon: Icons.zoom_out_rounded, name: 'Dentist'),
  Category(icon: Icons.favorite, name: 'Cardiolo...'),
  Category(icon: Icons.zoom_out_rounded, name: 'Dentist'),
  Category(icon: Icons.favorite, name: 'Cardiolo...'),
  Category(icon: Icons.favorite, name: 'Cardiolo...'),
  Category(icon: Icons.zoom_out_rounded, name: 'Dentist'),
  Category(icon: Icons.favorite, name: 'Cardiolo...'),
  Category(icon: Icons.zoom_out_rounded, name: 'Dentist'),
  Category(icon: Icons.favorite, name: 'Cardiolo...'),
  Category(icon: Icons.zoom_out_rounded, name: 'Dentist'),
  Category(icon: Icons.favorite, name: 'Cardiolo...'),
  Category(icon: Icons.favorite, name: 'Cardiolo...'),
  // ... boshqa kategoriyalar ...
];

// Kategoriya modeli
class Category {
  final IconData icon;
  final String name;

  const Category({
    required this.icon,
    required this.name,
  });
}
