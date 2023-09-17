import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/components/bookingall/busbooking.dart';
import 'package:travel_app/components/bookingall/flightbooking.dart';
import 'package:travel_app/components/bookingall/hotelbooking.dart';

class Bookingscreen extends StatefulWidget {
  const Bookingscreen({super.key});

  @override
  State<Bookingscreen> createState() => _BookingscreenState();
}

class _BookingscreenState extends State<Bookingscreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Theme.of(context).colorScheme.onPrimary),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.background,
        surfaceTintColor: Colors.transparent,
        title: Text(
          "Booking",
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        bottom: TabBar(
            padding: const EdgeInsets.only(left: 55, right: 55),
            unselectedLabelColor: Theme.of(context).colorScheme.onPrimary,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.orange,
            ),
            indicatorSize: TabBarIndicatorSize.tab,
            splashFactory: NoSplash.splashFactory,
            controller: _tabController,
            labelColor: Theme.of(context).colorScheme.background,
            tabs: const [
              Tab(
                icon: Icon(FontAwesomeIcons.hotel),
                text: "Hotels",
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.plane),
                text: "Flight",
              ),
              Tab(
                icon: Icon(FontAwesomeIcons.bus),
                text: "Bus",
              ),
            ]),
      ),
      body: TabBarView(controller: _tabController, children: const [
        Hotelbookingplace(),
        Flightbookingpage(),
        Busbookingpage(),
      ]),
    );
  }
}
