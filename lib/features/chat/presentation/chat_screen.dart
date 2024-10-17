//
// @Author: "Eldor Turgunov"
// @Date: 07.08.2024
// @File name: bookings_screen.dart
//

import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            backgroundColor: Theme.of(context).colorScheme.primary,
            centerTitle: true,
            // floating: false,
            title: Text(
              'Chat',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: Colors.white),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 8, bottom: 70),
              itemCount: 20,
              separatorBuilder: (context, index) => Divider(
                height: 1,
                color: Colors.grey.shade300,
                indent: 70,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              'Message $index asf as fas f as fas f asf asf as fa f a fa fas ',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0,
                                  ),
                            ),
                            Text(
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              'Message $index sdfsd sdf ds fsd fsd f s fs fsd fsd fsd fsd',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    letterSpacing: 0,
                                    color: Colors.grey.shade600,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                          width: 8), // title va trailing orasidagi bo'sh joy
                      Text('12:00',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    letterSpacing: 0,
                                    color: Colors.grey.shade600,
                                  )),
                    ],
                  ),
                  leading: const CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.white,
                    backgroundImage: NetworkImage(
                        'https://www.intervalloconsulting.com/wp-content/uploads/2017/02/pic7-1.jpg',
                        scale: 1.0),
                  ),
                  // trailing: Column(
                  //   children: [
                  //     Text('12:00',
                  //         style:
                  //             Theme.of(context).textTheme.bodyMedium!.copyWith(
                  //                   letterSpacing: 0,
                  //                   color: Colors.grey.shade600,
                  //                 )),
                  //     const SizedBox(
                  //       height: 4,
                  //     ),
                  //   ],
                  // ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
