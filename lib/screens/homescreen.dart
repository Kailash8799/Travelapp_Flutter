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

  final List<Widget> _screenoption = <Widget>[
    const Explorepage(),
    const Bookingpage(),
    const Mytrippage(),
    const Favouritepage(),
    const AlertDialog(elevation: 10, backgroundColor: Colors.red),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
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
        selectedLabelStyle: TextStyle(fontSize: 10),
        unselectedLabelStyle: TextStyle(fontSize: 10),
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
      body: _screenoption[_currentIndex],
    );
  }
}
