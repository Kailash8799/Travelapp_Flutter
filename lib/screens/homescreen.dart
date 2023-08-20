import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/homesubscreen/booking.dart';
import 'package:travel_app/homesubscreen/explore.dart';
import 'package:travel_app/homesubscreen/favourites.dart';
import 'package:travel_app/homesubscreen/mytrip.dart';
import 'package:travel_app/homesubscreen/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  StreamSubscription? connection;
  static bool isOffline = true;

  final List<Widget> _screenoption = <Widget>[
    const Explorepage(),
    const Bookingpage(),
    Mytrippage(isoffline: isOffline),
    const Favouritepage(),
    const Profilepage(),
  ];

  void checkConnection() {
    // print(isOffline);
    connection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // whenevery connection status is changed.
      if (result == ConnectivityResult.none) {
        //there is no any connection
        print("Hello");
        setState(() {
          isOffline = true;
        });
      } else if (result == ConnectivityResult.mobile) {
        //connection is mobile data network
        print("Hello1");
        setState(() {
          isOffline = false;
        });
      } else if (result == ConnectivityResult.wifi) {
        //connection is from wifi
        print("Hello2");
        setState(() {
          isOffline = false;
        });
      } else if (result == ConnectivityResult.ethernet) {
        //connection is from wired connection
        print("Hello4");
        setState(() {
          isOffline = false;
        });
      } else if (result == ConnectivityResult.bluetooth) {
        //connection is from bluetooth threatening
        print("Hello5");
        setState(() {
          isOffline = false;
        });
      }
    });
  }

  @override
  void initState() {
    checkConnection();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    connection!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        surfaceTintColor: Colors.transparent,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: "Explore",
            activeIcon: Icon(Icons.explore),
            icon: Icon(
              Icons.explore_outlined,
            ),
            tooltip: "Explore",
          ),
          BottomNavigationBarItem(
            label: "Booking",
            activeIcon: Icon(Icons.book_online),
            icon: Icon(
              Icons.book_online_outlined,
            ),
            tooltip: "Booking",
          ),
          BottomNavigationBarItem(
            label: "My Trips",
            activeIcon: Icon(Icons.home_repair_service_rounded),
            icon: Icon(
              Icons.home_repair_service_outlined,
            ),
            tooltip: "My Trips",
          ),
          BottomNavigationBarItem(
            label: "Favourites",
            activeIcon: Icon(Icons.favorite),
            icon: Icon(
              Icons.favorite_border,
            ),
            tooltip: "Favourites",
          ),
          BottomNavigationBarItem(
            label: "Profile",
            activeIcon: Icon(Icons.person),
            icon: Icon(
              Icons.person_outline,
            ),
            tooltip: "Profile",
          ),
        ],
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor: Theme.of(context).colorScheme.secondary,
        selectedLabelStyle: const TextStyle(fontSize: 10),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        onTap: (value) {
          setState(() {
            checkConnection();
            _currentIndex = value;
          });
        },
      ),
      body: _screenoption[_currentIndex],
    );
  }
}
