import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/components/booking/Hotelcard.dart';
import 'package:travel_app/components/booking/Hotelcardskeleton.dart';

class Bookingpage extends StatefulWidget {
  const Bookingpage({super.key});

  @override
  State<Bookingpage> createState() => _BookingpageState();
}

class _BookingpageState extends State<Bookingpage> {
  final String _selectedLocation = "Goa, India";
  final String _selectedDate = "24.04-30.05";
  final int _guestCount = 0;
  final int _roomCount = 0;
  final List<int> _hotels = [1, 2, 3, 4, 5, 6, 7, 8];

  StreamSubscription? connectiontrip;
  bool _isHoteloffline = true;
  void checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile) {
      setState(() {
        _isHoteloffline = false;
      });
    } else if (result == ConnectivityResult.wifi) {
      setState(() {
        _isHoteloffline = false;
      });
    } else if (result == ConnectivityResult.ethernet) {
      setState(() {
        _isHoteloffline = false;
      });
    } else if (result == ConnectivityResult.bluetooth) {
      setState(() {
        _isHoteloffline = false;
      });
    } else if (result == ConnectivityResult.none) {
      setState(() {
        _isHoteloffline = true;
      });
    }
  }

  @override
  void initState() {
    checkConnectivity();
    connectiontrip = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // whenevery connection status is changed.
      if (result == ConnectivityResult.none) {
        //there is no any connection
        setState(() {
          _isHoteloffline = true;
        });
      } else if (result == ConnectivityResult.mobile) {
        //connection is mobile data network
        setState(() {
          _isHoteloffline = false;
        });
      } else if (result == ConnectivityResult.wifi) {
        //connection is from wifi
        setState(() {
          _isHoteloffline = false;
        });
      } else if (result == ConnectivityResult.ethernet) {
        //connection is from wired connection
        setState(() {
          _isHoteloffline = false;
        });
      } else if (result == ConnectivityResult.bluetooth) {
        //connection is from bluetooth threatening
        setState(() {
          _isHoteloffline = false;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    connectiontrip!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          toolbarHeight: 45,
          surfaceTintColor: Colors.transparent,
          title: Text("Hotels"),
          floating: true,
          snap: true,
          leading: BackButton(),
          centerTitle: true,
        ),
        SliverAppBar(
          surfaceTintColor: Colors.transparent,
          pinned: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: MySeparator(color: Colors.grey[300]!),
            ),
          ),
          toolbarHeight: 45,
          title: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () {},
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.orange,
                ),
                Text(
                  _selectedLocation,
                  style: const TextStyle(
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverAppBar(
          toolbarHeight: 45,
          surfaceTintColor: Colors.transparent,
          pinned: true,
          title: Row(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
                    const Icon(
                      Icons.date_range,
                      size: 15,
                    ),
                    Text(
                      _selectedDate,
                      style: const TextStyle(
                        fontFamily: "Quicksand",
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    const Icon(
                      Icons.people_alt_rounded,
                      size: 15,
                    ),
                    Text(
                      "$_guestCount guest,",
                      style: const TextStyle(
                        fontFamily: "Quicksand",
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "$_roomCount room",
                      style: const TextStyle(
                        fontFamily: "Quicksand",
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width,
                        );
                      },
                    );
                  },
                  child: Text(
                    "Filter results",
                    style: TextStyle(
                      fontFamily: "Quicksand",
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      decoration: TextDecoration.combine([
                        TextDecoration.underline,
                      ]),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        _isHoteloffline
            ? SliverList.builder(
                itemCount: _hotels.length,
                itemBuilder: (context, index) {
                  return const Hotelcardskeleton();
                },
              )
            : SliverList.builder(
                itemCount: _hotels.length,
                itemBuilder: (context, index) {
                  return HotelCardcomp(
                    doublebed: 2,
                    hotelImage:
                        "https://images.oyoroomscdn.com/uploads/hotel_image/17536/large/1628521e0b5dd874.jpg",
                    hotelname: "Parivar Hotel",
                    hotelrent: 200,
                    hotelspecification: "Double room with bed",
                    isAc: true,
                    isBath: true,
                    tag: "imagecard$index",
                    hotelstar: 3,
                    likedper: 96,
                  );
                },
              )
      ],
    );
  }
}

class MySeparator extends StatelessWidget {
  const MySeparator({Key? key, this.height = 1, this.color = Colors.black})
      : super(key: key);
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final boxWidth = constraints.constrainWidth();
        const dashWidth = 10.0;
        final dashHeight = height;
        final dashCount = (boxWidth / (2 * dashWidth)).floor();
        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: Axis.horizontal,
          children: List.generate(dashCount, (_) {
            return SizedBox(
              width: dashWidth,
              height: dashHeight,
              child: DecoratedBox(
                decoration: BoxDecoration(color: color),
              ),
            );
          }),
        );
      },
    );
  }
}
