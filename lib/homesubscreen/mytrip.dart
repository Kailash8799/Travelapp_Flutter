import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/components/upcomingtripcard.dart';
import 'package:travel_app/screens/homescreen.dart';

class Mytrippage extends StatefulWidget {
  const Mytrippage({super.key});

  @override
  State<Mytrippage> createState() => _MytrippageState();
}

class _MytrippageState extends State<Mytrippage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: CustomScrollView(slivers: [
          SliverAppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(CupertinoPageRoute(
                  builder: (context) {
                    return const HomeScreen();
                  },
                ));
              },
            ),
            surfaceTintColor: Colors.transparent,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: const Text(
              "My Trips",
              textAlign: TextAlign.center,
            ),
            floating: true,
            snap: true,
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            toolbarHeight: 70,
            surfaceTintColor: Colors.transparent,
            title: Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 17),
              decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.all(
                  Radius.circular(100),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: const Text(
                      "Upcoming",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: const Text(
                      "Archive",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: Column(
              children: [
                Myupcomingtrip(),
                Myupcomingtrip(),
                Myupcomingtrip(),
                Myupcomingtrip(),
                Myupcomingtrip(),
                Myupcomingtrip(),
                Myupcomingtrip(),
                Myupcomingtrip(),
                Myupcomingtrip(),
                Myupcomingtrip(),
                Myupcomingtrip(),
                Myupcomingtrip(),
              ],
            ),
          ),
        ]),

        //   child:
        //   Column(
        //     children: [
        //       Container(
        //         height: 50,
        //         margin: const EdgeInsets.symmetric(horizontal: 17),
        //         decoration: const BoxDecoration(
        //           color: Colors.orange,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(100),
        //           ),
        //         ),
        //         child: Row(
        //           mainAxisAlignment: MainAxisAlignment.spaceAround,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: [
        //             AnimatedContainer(
        //               duration: const Duration(seconds: 2),
        //               padding: const EdgeInsets.symmetric(
        //                   horizontal: 35, vertical: 10),
        //               decoration: const BoxDecoration(
        //                 color: Colors.white,
        //                 borderRadius: BorderRadius.all(
        //                   Radius.circular(100),
        //                 ),
        //               ),
        //               child: const Text(
        //                 "Upcoming",
        //                 style: TextStyle(
        //                   color: Colors.black,
        //                   fontSize: 17,
        //                 ),
        //               ),
        //             ),
        //             AnimatedContainer(
        //               duration: const Duration(seconds: 2),
        //               padding: const EdgeInsets.symmetric(horizontal: 35),
        //               child: const Text(
        //                 "Archive",
        //                 style: TextStyle(
        //                   color: Colors.white,
        //                   fontSize: 17,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         ),
        //       ),
        //       const Column(
        //         children: [
        //           Myupcomingtrip(),
        //           Myupcomingtrip(),
        //           Myupcomingtrip(),
        //           Myupcomingtrip(),
        //           Myupcomingtrip(),
        //           Myupcomingtrip(),
        //           Myupcomingtrip(),
        //           Myupcomingtrip(),
        //           Myupcomingtrip(),
        //           Myupcomingtrip(),
        //           Myupcomingtrip(),
        //           Myupcomingtrip(),
        //         ],
        //       )
        //     ],
        //   ),
        // ),
      ),
    );
  }
}
