import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart' hide ConnectionState;
import 'package:travel_app/components/booking/Hotelcard.dart';
import 'package:travel_app/components/booking/Hotelcardskeleton.dart';
import 'package:travel_app/models/listing.dart';
import 'package:travel_app/realm/realm_services.dart';
import 'package:travel_app/realm/schemas.dart';
import 'package:travel_app/screens/locationscree.dart';

class Bookingpage extends StatefulWidget {
  const Bookingpage({super.key});

  @override
  State<Bookingpage> createState() => _BookingpageState();
}

class _BookingpageState extends State<Bookingpage> {
  String _selectedLocation = "India";
  String _country = "IND";
  int _guestCount = 0;
  int _roomCount = 0;
  int _price = 0;
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
    final realmServices = Provider.of<RealmServices>(context);
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverAppBar(
          toolbarHeight: 45,
          surfaceTintColor: Colors.transparent,
          title: Text("Hotels"),
          floating: true,
          snap: true,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        SliverAppBar(
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          pinned: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(1),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: MySeparator(color: Colors.grey[300]!),
            ),
          ),
          toolbarHeight: 45,
          title: InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            onTap: () async {
              final Map<String, dynamic>? country = await Navigator.push(
                context,
                CupertinoDialogRoute(
                  builder: (context) {
                    return const Setlocationscreen();
                  },
                  context: context,
                ),
              );
              if (country != null) {
                setState(() {
                  _country = country["countryCode"];
                  _selectedLocation = country["selectedCountry"];
                });
              }
            },
            child: Row(
              children: [
                const Icon(
                  Icons.location_on,
                  color: Colors.orange,
                ),
                Text(
                  _selectedLocation.length > 18
                      ? "${_selectedLocation.substring(0, 17)}..."
                      : _selectedLocation,
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
          automaticallyImplyLeading: false,
          toolbarHeight: 45,
          surfaceTintColor: Colors.transparent,
          pinned: true,
          title: Row(
            children: [
              Expanded(
                flex: 3,
                child: Row(
                  children: [
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
                  onTap: () async {
                    await showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        int guest = _guestCount;
                        int room = _roomCount;
                        int price = _price;
                        return StatefulBuilder(
                            builder: (context, StateSetter mystate) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.width + 150,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10, top: 16),
                                    child: Text("Guests",
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(100))),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: IconButton(
                                              onPressed: () {
                                                mystate(() {
                                                  if (guest > 0) {
                                                    guest -= 1;
                                                  }
                                                });
                                              },
                                              icon: const Icon(
                                                FontAwesomeIcons.circleMinus,
                                                size: 35,
                                                color: Colors.orange,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              "$guest",
                                              style:
                                                  const TextStyle(fontSize: 26),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: IconButton(
                                              onPressed: () {
                                                mystate(() {
                                                  if (guest < 4) {
                                                    guest += 1;
                                                  }
                                                });
                                              },
                                              icon: const Icon(
                                                FontAwesomeIcons.circlePlus,
                                                size: 35,
                                                color: Colors.orange,
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10, top: 16),
                                    child: Text("Rooms",
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(100))),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: IconButton(
                                              onPressed: () {
                                                mystate(() {
                                                  if (room > 0) {
                                                    room -= 1;
                                                  }
                                                });
                                              },
                                              icon: const Icon(
                                                FontAwesomeIcons.circleMinus,
                                                size: 35,
                                                color: Colors.orange,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              "$room",
                                              style:
                                                  const TextStyle(fontSize: 26),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: IconButton(
                                              onPressed: () {
                                                mystate(() {
                                                  if (room < 4) {
                                                    room += 1;
                                                  }
                                                });
                                              },
                                              icon: const Icon(
                                                FontAwesomeIcons.circlePlus,
                                                size: 35,
                                                color: Colors.orange,
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(left: 10, top: 16),
                                    child: Text("Price",
                                        style: TextStyle(fontSize: 20)),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSecondary),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(100))),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: IconButton(
                                              onPressed: () {
                                                mystate(() {
                                                  if (price > 0) {
                                                    price -= 1;
                                                  }
                                                });
                                              },
                                              icon: const Icon(
                                                FontAwesomeIcons.circleMinus,
                                                size: 35,
                                                color: Colors.orange,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Text(
                                              "$price",
                                              style:
                                                  const TextStyle(fontSize: 26),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: IconButton(
                                              onPressed: () {
                                                mystate(() {
                                                  if (price < 4) {
                                                    price += 1;
                                                  }
                                                });
                                              },
                                              icon: const Icon(
                                                FontAwesomeIcons.circlePlus,
                                                size: 35,
                                                color: Colors.orange,
                                              ),
                                            ),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(height: 30),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.orange,
                                          minimumSize:
                                              const Size.fromHeight(50)),
                                      onPressed: () {
                                        setState(() {
                                          _guestCount = guest;
                                          _roomCount = room;
                                          _price = price;
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text(
                                        "Apply",
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                              ),
                            ),
                          );
                        });
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
            : StreamBuilder<RealmResultsChanges<Listing>>(
                stream: realmServices.realm
                    .query<Listing>(
                        "price >= $_price AND roomCount >= $_roomCount AND guestCount >= $_guestCount AND country=='$_country' SORT(_id ASC)")
                    .changes,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SliverList.builder(
                      itemCount: _hotels.length,
                      itemBuilder: (context, index) {
                        return const Hotelcardskeleton();
                      },
                    );
                  } else {
                    if (snapshot.hasData &&
                        snapshot.data != null &&
                        snapshot.data!.results.isNotEmpty) {
                      final results = snapshot.data!.results;
                      return SliverList.builder(
                        itemCount: results.realm.isClosed ? 0 : results.length,
                        itemBuilder: (context, index) {
                          return results[index].isValid
                              ? HotelCardcomp(
                                  data: Listingmodel.fromJson(results[index]),
                                )
                              : const SizedBox(height: 0);
                        },
                      );
                    } else {
                      return SliverToBoxAdapter(
                        child: SizedBox(
                          height: 500,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "No hotels found",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _guestCount = 0;
                                      _price = 0;
                                      _roomCount = 0;
                                      _country = "IND";
                                      _selectedLocation = "India";
                                    });
                                  },
                                  child: const Text("Reset Filters"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                  }
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
