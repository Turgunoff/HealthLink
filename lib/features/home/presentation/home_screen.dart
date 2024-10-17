//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: home_screen.dart
//

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
// import 'package:iconsax/iconsax.dart';

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
              surfaceTintColor: Colors.transparent,
              floating: true,
              elevation: 4,
              shadowColor: Colors.grey.shade100,
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
                        Iconsax.location_outline,
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
                        Iconsax.arrow_down_1_outline,
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
                        Theme.of(context).secondaryHeaderColor),
                  ),
                  highlightColor: Colors.grey.shade400,
                  tooltip: context.tr('notifications'),
                  onPressed: () {},
                  icon: Icon(
                    Iconsax.notification_outline,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                const SizedBox(
                  width: 16,
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
                          child: Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 2,
                                    blurRadius: 4,
                                    offset: const Offset(0, 1),
                                  )
                                ]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Iconsax.search_normal_outline,
                                  size: 24,
                                  color: Theme.of(context).primaryColor,
                                ),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'Search',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                        color: Colors.grey.shade500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Expanded(
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       pushScreen(
                        //         context,
                        //         withNavBar: true,
                        //         screen: const SearchScreen(),
                        //       );
                        //     },
                        //     child: TextFormField(
                        //       textAlign: TextAlign.justify,
                        //       decoration: InputDecoration(
                        //         fillColor: Colors.white,
                        //         border: OutlineInputBorder(
                        //           borderRadius: BorderRadius.circular(8),
                        //           borderSide: BorderSide.none,
                        //         ),
                        //         hintText: 'Search',
                        //         hintStyle: Theme.of(context)
                        //             .textTheme
                        //             .bodyLarge!
                        //             .copyWith(
                        //               color: Colors.grey.shade500,
                        //             ),
                        //         prefixIcon: Icon(
                        //           Iconsax.search_normal,
                        //           color: Theme.of(context).primaryColor,
                        //           size: 20,
                        //         ),
                        //         filled: true,
                        //         enabled: false,
                        //         contentPadding: const EdgeInsets.symmetric(
                        //             vertical: 8, horizontal: 0),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                                    fontWeight: FontWeight.w400,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Iconsax.like_1_outline,
                                  size: 40,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              Text(
                                'asdasssdsasdsadda',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Iconsax.document_1_bulk,
                                  size: 40,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              Text(
                                'asdasssdsasdsadda',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Iconsax.document_1_outline,
                                  size: 40,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                              Text(
                                'asdasssdsasdsadda',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).colorScheme.secondary,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                                child: Icon(
                                  Iconsax.document_1_outline,
                                  size: 40,
                                  color: Theme.of(context).colorScheme.primary,
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
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text(
                              context.tr('nearby_hospitals'),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 18,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400,
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
                    //horizontal listview.builder

                    SizedBox(
                      height: 250,
                      child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Card(
                              clipBehavior: Clip
                                  .antiAlias, // Rasmni card chetlariga moslash
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Elementlarni chapga tekislash
                                children: [
                                  Stack(
                                    children: [
                                      Image.network(
                                        'https://avatars.mds.yandex.net/i?id=0ce2b726578b23b5845d8653a45eea27833d7526-8526247-images-thumbs&n=13', // Rasm URL manzili
                                        height: 150,
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.6, // Rasmni card kengligiga moslash
                                        fit: BoxFit
                                            .cover, // Rasmni cardga to'liq moslash
                                      ),
                                      Positioned(
                                        top: 10,
                                        right: 10,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              Colors.white.withOpacity(0.5),
                                          radius: 15,
                                          child: const Icon(
                                            Iconsax.heart_outline,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 10,
                                        right: 10,
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 4),
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12),
                                              bottomLeft: Radius.circular(12),
                                              bottomRight: Radius.circular(0),
                                            ),
                                          ),
                                          child: const Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: Colors.amber,
                                                size: 16,
                                              ),
                                              Text(
                                                '4.8',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'ElevateDental',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.access_time,
                                              color: Colors.blue,
                                              size: 16,
                                            ),
                                            SizedBox(width: 4),
                                            Text('15 min • 1.5km'),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(right: 16),
                            child: Text(
                              context.tr('top_specialist'),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    fontSize: 18,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w400,
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
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          width: 80,
                                          height: 100,
                                          fit: BoxFit.cover,
                                          'https://remontka.pro/images/reset-password-windows-10-1803.png',
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                    horizontal: 8,
                                                    vertical: 4,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Theme.of(context)
                                                        .colorScheme
                                                        .secondary,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16),
                                                  ),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Iconsax
                                                            .tick_square_outline,
                                                        size: 14,
                                                        color: Theme.of(context)
                                                            .colorScheme
                                                            .primary,
                                                      ),
                                                      const SizedBox(width: 4),
                                                      Text(
                                                        'Proffessional Doctor',
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .bodySmall!
                                                            .copyWith(
                                                              color: Theme.of(
                                                                      context)
                                                                  .colorScheme
                                                                  .primary,
                                                              letterSpacing: 0,
                                                            ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Spacer(),
                                                Icon(
                                                  Iconsax.heart_bold,
                                                  size: 24,
                                                  color: Theme.of(context)
                                                      .colorScheme
                                                      .primary,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              'Dr. Jane Cooper',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      letterSpacing: 0,
                                                      fontWeight:
                                                          FontWeight.w500),
                                            ),
                                            Text(
                                              'Dentist',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      letterSpacing: 0,
                                                      color: Colors.grey),
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow[700],
                                                  size: 16,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow[700],
                                                  size: 16,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow[700],
                                                  size: 16,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow[700],
                                                  size: 16,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow[700],
                                                  size: 16,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  '4.8',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        letterSpacing: 0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                ),
                                                const Spacer(),
                                                Container(
                                                  height: 16,
                                                  width: 1,
                                                  color: Colors.grey,
                                                ),
                                                const Spacer(),
                                                Text(
                                                  '49 reviews',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium!
                                                      .copyWith(
                                                        letterSpacing: 0,
                                                        color: Colors.grey,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 8),
                                  Container(
                                    alignment: Alignment.center,
                                    width: double.infinity,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12.0),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Text(
                                      'Make Appointment',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),

                    /// AntDesign's Icon
                    const Icon(AntDesign.gitlab_fill),

                    /// Bootstrap's Icon
                    const Icon(Bootstrap.alarm),

                    /// BoxIcons' Icon
                    const Icon(BoxIcons.bxs_yin_yang),

                    /// Brand's Logo
                    Brand(Brands.aliexpress),

                    /// Clarity's Icon
                    const Icon(Clarity.map_outline_badged),

                    /// EvaIcons' Icon
                    const Icon(EvaIcons.clipboard),

                    /// Flag's Logo
                    Flag(Flags.kazakhstan),

                    /// FontAwesome's Icons
                    const Icon(FontAwesome.angular_brand),

                    /// HeroIcons' Icon
                    const Icon(HeroIcons.printer),

                    /// Iconsax's Icon
                    const Icon(Iconsax.cake_outline),

                    /// IonIcons' Icon
                    const Icon(IonIcons.bug),

                    /// LineAwesome's Icon
                    const Icon(LineAwesome.amazon),

                    /// MingCute's Icon
                    const Icon(MingCute.knife_line),

                    /// OctIcons'Icon
                    const Icon(OctIcons.code_of_conduct),

                    /// PixelArtIcons' Icon
                    const Icon(PixelArtIcons.gif),

                    /// TeenyIcons' Icon
                    const Icon(TeenyIcons.apple),

                    /// ZondIcons' Icon
                    const Icon(ZondIcons.shield),
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
