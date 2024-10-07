//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: home_screen.dart
//


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:health_link/features/search/presentation/search_screen.dart';
import 'package:health_link/features/widgets/custom_text_form_fild.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

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
  // Future<List<Doctor>> fetchDoctors() async {
  //   final response =
  //       await http.get(Uri.parse('http://54.93.198.137:3000/doctors'));

  //   if (response.statusCode == 200) {
  //     final List<dynamic> jsonData = json.decode(response.body);
  //     return jsonData.map((doctorData) => Doctor.fromJson(doctorData)).toList();
  //   } else {
  //     throw Exception('Failed to load doctors');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              toolbarHeight: 70,
              floating: true,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.tr('location'),
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          letterSpacing: 0,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Iconsax.location,
                        size: 18,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Tashkent, Uzbekistan',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              letterSpacing: 0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(width: 4),
                      Icon(
                        Iconsax.arrow_square_down,
                        size: 18,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ],
              ),
              actions: [
                IconButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        Theme.of(context).colorScheme.primary),
                  ),
                  highlightColor: Colors.grey.shade400,
                  tooltip: context.tr('notifications'),
                  onPressed: () {},
                  icon: const Icon(Iconsax.notification_bing),
                ),
              ],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              pushScreen(
                                context,
                                withNavBar: true,
                                screen: const SearchScreen(),
                              );
                            },
                            child: CustomTextFormFild(
                              hint: 'Search',
                              prefixIcon: Iconsax.search_normal,
                              filled: true,
                              enabled: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text(
                              context.tr('doctor_speciality'),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 18,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(left: 16),
                            child: Text(
                              context.tr('see_all'),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    letterSpacing: 0,
                                    color: Theme.of(context).primaryColor,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 130,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 15,
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            width: 80,
                            margin: const EdgeInsets.only(right: 16),
                            child: Column(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  padding: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary,
                                    border: Border.all(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                  child: Image.asset(
                                    'assets/icons/teeth.png',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  'Dentist',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      height: 5555,
                      color: Colors.red,
                      width: 130,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// return Scaffold(
    //   extendBodyBehindAppBar: false,
    //   backgroundColor: Colors.white,
    //   appBar: AppBar(
    //     bottom: PreferredSize(
    //       preferredSize: const Size.fromHeight(4.0), // Chiziqning balandligi
    //       child: Container(
    //         color: Colors.blue, // Chiziqning rangi
    //       ),
    //     ),
    //     surfaceTintColor: Colors.transparent,
    //     backgroundColor: Colors.white,
    //     title: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Text(
    //           context.tr('location'),
    //           style: TextStyle(
    //             fontSize: 16,
    //             color: Colors.grey.shade600,
    //           ),
    //         ),
    //         const SizedBox(height: 4),
    //         const Row(
    //           children: [
    //             const Icon(
    //               Iconsax.location,
    //               size: 18,
    //               color: Colors.blue,
    //             ),
    //             SizedBox(width: 4),
    //             Text(
    //               'Tashkent, Uzbekistan',
    //               style: TextStyle(
    //                 fontSize: 18,
    //                 color: Colors.black,
    //               ),
    //             ),
    //             SizedBox(width: 4),
    //             Icon(
    //               Iconsax.arrow_square_down,
    //               size: 18,
    //               color: Colors.blue,
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //     actions: [
    //       IconButton(
    //         style: ButtonStyle(
    //           backgroundColor: WidgetStateProperty.all(Colors.grey.shade200),
    //         ),
    //         highlightColor: Colors.grey.shade400,
    //         tooltip: context.tr('notifications'),
    //         onPressed: () {},
    //         icon: const Icon(Iconsax.notification_bing),
    //       ),
    //     ],
    //   ),
    //   body:Single
    //   // body: FutureBuilder<List<Doctor>>(
    //   //   future: fetchDoctors(),
    //   //   builder: (context, snapshot) {
    //   //     if (snapshot.connectionState == ConnectionState.waiting) {
    //   //       return const Center(child: CircularProgressIndicator());
    //   //     } else if (snapshot.hasError) {
    //   //       return Center(child: Text('Error: ${snapshot.error}'));
    //   //     } else if (snapshot.hasData) {
    //   //       List<Doctor> doctors = snapshot.data!;
    //   //       doctors.sort((a, b) {
    //   //         if (a.rating == null && b.rating == null) return 0;
    //   //         if (a.rating == null) return 1;
    //   //         if (b.rating == null) return -1;
    //   //         return b.rating!.compareTo(a.rating!);
    //   //       });
    //   //       return ListView.builder(
    //   //         itemCount: snapshot.data!.length,
    //   //         itemBuilder: (context, index) {
    //   //           final doctor = snapshot.data![index];
    //   //           return ListTile(
    //   //             // Or a more customized widget
    //   //             title: Text('${doctor.firstName} ${doctor.lastName}'),
    //   //             subtitle: Text(doctor.specialization!),
    //   //             onTap: () {
    //   //               // Navigate to DoctorDetailScreen with the selected doctor's data
    //   //               pushScreen(
    //   //                 context,
    //   //                 withNavBar: true,
    //   //                 screen: DoctorDetailScreen(doctor: doctor),
    //   //               );
    //   //             },
    //   //           );
    //   //         },
    //   //       );
    //   //     } else {
    //   //       return const Center(child: Text('No doctors found'));
    //   //     }
    //   //   },
    //   // ),
    // );