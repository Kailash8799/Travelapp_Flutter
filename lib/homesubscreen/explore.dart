import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart' hide ConnectionState;
import 'package:travel_app/components/categoryhomepage.dart';
import 'package:travel_app/components/homecard/homecard.dart';
import 'package:travel_app/components/homecard/homecardloading.dart';
import 'package:travel_app/components/homegridcard/homegridcard.dart';
import 'package:travel_app/components/homegridcard/homegridcardloading.dart';
import 'package:travel_app/components/locationstory.dart';
import 'package:travel_app/models/places.dart';
import 'package:travel_app/realm/realm_services.dart';
import 'package:travel_app/screens/locationscree.dart';
import 'package:travel_app/screens/notificationscreen.dart';
import 'package:travel_app/screens/searchscreen.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:travel_app/realm/schemas.dart';

class Explorepage extends StatefulWidget {
  const Explorepage({super.key});
  @override
  State<Explorepage> createState() => _ExplorepageState();
}

class _ExplorepageState extends State<Explorepage> {
  StreamSubscription? connection;
  static bool isoffline = true;
  int counter = 1;
  late String _location = "India";
  String _countryCode = "IND";
  List<String> images = [
    "https://images.unsplash.com/photo-1626606076701-cf4ae64b2b03?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1332&q=80",
    "https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z29hJTIwYmVhY2h8ZW58MHx8MHx8fDA%3D&w=1000&q=80"
  ];

  final dynamic filters = [
    {"category": "All", "icon": Icons.local_fire_department_outlined},
    {"category": "Tropical", "icon": Icons.local_fire_department_outlined},
    {"category": "Lake", "icon": Icons.local_fire_department_outlined},
    {"category": "Beach", "icon": Icons.local_fire_department_outlined},
    {"category": "Mountain", "icon": Icons.local_fire_department_outlined},
    {"category": "Farm", "icon": Icons.local_fire_department_outlined},
  ];
  int _selectedFilter = 0;

  void checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile) {
      setState(() {
        isoffline = false;
      });
    } else if (result == ConnectivityResult.wifi) {
      setState(() {
        isoffline = false;
      });
    } else if (result == ConnectivityResult.ethernet) {
      setState(() {
        isoffline = false;
      });
    } else if (result == ConnectivityResult.bluetooth) {
      setState(() {
        isoffline = false;
      });
    } else if (result == ConnectivityResult.none) {
      setState(() {
        isoffline = true;
      });
    }
  }

  @override
  void initState() {
    checkConnectivity();
    connection = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // whenevery connection status is changed.
      if (result == ConnectivityResult.none) {
        //there is no any connection
        setState(() {
          isoffline = true;
        });
      } else if (result == ConnectivityResult.mobile) {
        //connection is mobile data network
        setState(() {
          isoffline = false;
        });
      } else if (result == ConnectivityResult.wifi) {
        //connection is from wifi
        setState(() {
          isoffline = false;
        });
      } else if (result == ConnectivityResult.ethernet) {
        //connection is from wired connection
        setState(() {
          isoffline = false;
        });
      } else if (result == ConnectivityResult.bluetooth) {
        //connection is from bluetooth threatening
        setState(() {
          isoffline = false;
        });
      }
    });
    super.initState();
  }

  void _changeCategory(index) {
    setState(() {
      _selectedFilter = index;
    });
  }

  @override
  void dispose() {
    connection!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final realmServices = Provider.of<RealmServices>(context);
    // final globalProvider = Provider.of<GlobalValue>(context, listen: false);
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).colorScheme.background,
            surfaceTintColor: Colors.transparent,
            snap: true,
            elevation: 4,
            floating: true,
            toolbarHeight: 50,
            title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  // globalProvider.toggleDrawer();
                },
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey[200]!,
                  backgroundImage: const NetworkImage(
                    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Hello,",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 2),
                child: Text(
                  "Kailash",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Nunito",
                  ),
                ),
              )
            ]),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: InkWell(
                  splashFactory: NoSplash.splashFactory,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Image.asset(
                    "assets/images/logo.png",
                  ),
                ),
              )
            ],
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 50,
            backgroundColor: Theme.of(context).colorScheme.background,
            pinned: true,
            title: InkWell(
              splashFactory: NoSplash.splashFactory,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
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
                setState(() {
                  if (country != null) {
                    _countryCode = country["countryCode"];
                    _location = country["selectedCountry"];
                  }
                });
              },
              child: Row(
                children: [
                  const Icon(Icons.location_pin),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Text(_location.length > 18
                        ? "${_location.substring(0, 17)}..."
                        : _location),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.orange,
                    size: 30,
                  )
                ],
              ),
            ),
            actions: <Widget>[
              // Using Stack to show Notification Badge
              Stack(
                children: <Widget>[
                  IconButton(
                      padding: const EdgeInsets.only(right: 4),
                      icon: const Icon(Icons.notifications),
                      onPressed: () {
                        setState(() {
                          counter = 0;
                        });
                        Navigator.push(context, CupertinoPageRoute(
                          builder: (context) {
                            return const NotificationScreen();
                          },
                        ));
                      }),
                  counter != 0
                      ? Positioned(
                          right: 11,
                          top: 10,
                          child: InkWell(
                            splashFactory: NoSplash.splashFactory,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                counter = 0;
                              });
                              Navigator.push(context, CupertinoPageRoute(
                                builder: (context) {
                                  return const NotificationScreen();
                                },
                              ));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 12,
                                maxHeight: 14,
                                minHeight: 10,
                              ),
                              child: Text(
                                '$counter',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ],
            surfaceTintColor: Colors.transparent,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      customBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(
                          builder: (context) {
                            return const SearchScreen();
                          },
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.fromBorderSide(
                            BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        margin: const EdgeInsets.only(left: 20, right: 0),
                        child: const Text("Search here..."),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 15),
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 300,
                                color: Colors.red,
                              );
                            },
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Colors.orange,
                                Colors.yellow,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: const EdgeInsets.all(7),
                          child: const Icon(
                            Icons.filter,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Row(
                  children: [
                    Locationstorycomp(
                        country: "India",
                        image:
                            "https://images.unsplash.com/photo-1599457382197-820d65b8bbdc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGdpcmx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
                    Locationstorycomp(
                        country: "Russia",
                        image:
                            "https://images.unsplash.com/photo-1631947430066-48c30d57b943?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Z2lybHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                    Locationstorycomp(
                        country: "UK",
                        image:
                            "https://images.unsplash.com/photo-1599457382197-820d65b8bbdc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGdpcmx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
                    Locationstorycomp(
                        country: "USA",
                        image:
                            "https://images.unsplash.com/photo-1599457382197-820d65b8bbdc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGdpcmx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
                    Locationstorycomp(
                        country: "Dubai",
                        image:
                            "https://images.unsplash.com/photo-1599457382197-820d65b8bbdc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGdpcmx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 14, right: 10, bottom: 7),
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    return Categorycomp(
                        isSelected: _selectedFilter,
                        index: index,
                        category: filters[index]["category"],
                        icon: filters[index]["icon"],
                        callBack: _changeCategory);
                  },
                ),
              ),
            ),
          ),
          !isoffline
              ? SliverToBoxAdapter(
                  // child: FutureBuilder(
                  //   future: HomePlaces.getPlaces(
                  //       filters[_selectedFilter]["category"], _countryCode),
                  child: StreamBuilder<RealmResultsChanges<Place>>(
                    stream: realmServices.realm
                        .query<Place>(
                            "country == '$_countryCode' ${filters[_selectedFilter]["category"] != 'All' ? 'AND category == "${filters[_selectedFilter]['category']}"' : ''} SORT(_id ASC)")
                        .changes,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return SizedBox(
                          height: 290,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: const [Homecardloadingcomp()],
                          ),
                        );
                      } else {
                        if (snapshot.hasData &&
                            snapshot.data != null &&
                            snapshot.data!.results.isNotEmpty) {
                          final results = snapshot.data!.results;
                          return SizedBox(
                            height: 290,
                            child: ListView.builder(
                              itemCount:
                                  results.length > 1 ? 2 : results.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return results[index].isValid
                                    ? Homecardcomp(
                                        data: Placesmodel.fromJson(
                                            results[index]),
                                      )
                                    : const SizedBox(height: 0, width: 0);
                              },
                            ),
                          );
                        }
                      }
                      return const SizedBox(
                        height: 0,
                        width: 0,
                      );
                    },
                  ),
                )
              : const SliverToBoxAdapter(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Homecardloadingcomp(),
                        Homecardloadingcomp(),
                        Homecardloadingcomp(),
                      ],
                    ),
                  ),
                ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          //     child: const Text(
          //       "Top place",
          //       style: TextStyle(
          //         fontSize: 24,
          //         fontWeight: FontWeight.w500,
          //       ),
          //     ),
          //   ),
          // ),
          // !isoffline
          //     ? const SliverToBoxAdapter(
          //         child: SingleChildScrollView(
          //           scrollDirection: Axis.horizontal,
          //           child: Row(
          //             children: [
          //               Topplacecomp(
          //                 image:
          //                     "https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z29hJTIwYmVhY2h8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
          //                 location: "Goa, India",
          //                 placename: "Goa south beach",
          //                 placereview: "40",
          //                 tag: "goagood",
          //                 reviewavatar: [
          //                   "https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z29hJTIwYmVhY2h8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
          //                   "https://images.unsplash.com/photo-1462331940025-496dfbfc7564?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGhvdG98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
          //                   "https://plus.unsplash.com/premium_photo-1676009648296-227e4bdf495a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGhvdG98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"
          //                 ],
          //               ),
          //               Topplacecomp(
          //                 image:
          //                     "https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z29hJTIwYmVhY2h8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
          //                 location: "Goa, India",
          //                 placename: "Goa south beach",
          //                 placereview: "40",
          //                 tag: "goagoodc",
          //                 reviewavatar: [
          //                   "https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z29hJTIwYmVhY2h8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
          //                   "https://images.unsplash.com/photo-1462331940025-496dfbfc7564?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGhvdG98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
          //                   "https://plus.unsplash.com/premium_photo-1676009648296-227e4bdf495a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGhvdG98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"
          //                 ],
          //               ),
          //             ],
          //           ),
          //         ),
          //       )
          //     : const SliverToBoxAdapter(
          //         child: SingleChildScrollView(
          //           scrollDirection: Axis.horizontal,
          //           child: Row(
          //             children: [
          //               Topplaceloadingcomp(),
          //               Topplaceloadingcomp(),
          //             ],
          //           ),
          //         ),
          //       ),
          !isoffline
              ? StreamBuilder<RealmResultsChanges<Place>>(
                  stream: realmServices.realm
                      .query<Place>(
                          "country == '$_countryCode' ${filters[_selectedFilter]["category"] != 'All' ? 'AND category == "${filters[_selectedFilter]['category']}"' : ''} SORT(_id ASC)")
                      .changes,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return SliverList.builder(
                        itemBuilder: (context, index) {
                          return const Homegridcardloadingcomp();
                        },
                        itemCount: 10,
                      );
                    } else {
                      if (snapshot.hasData &&
                          snapshot.data != null &&
                          snapshot.data!.results.isNotEmpty) {
                        final results = snapshot.data!.results;
                        return SliverList.builder(
                          itemCount:
                              results.length > 2 ? results.length - 2 : 0,
                          itemBuilder: (context, index) {
                            return results[index].isValid
                                ? Homegridcardcomp(
                                    data: Placesmodel.fromJson(
                                      results[index + 2],
                                    ),
                                  )
                                : const SizedBox(height: 0, width: 0);
                          },
                        );
                      }
                    }
                    return SliverToBoxAdapter(
                      child: SizedBox(
                        height: 0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: const [Homegridcardloadingcomp()],
                        ),
                      ),
                    );
                  },
                )
              : SliverList.builder(
                  itemBuilder: (context, index) {
                    return const Homegridcardloadingcomp();
                  },
                  itemCount: 10,
                ),
        ],
      ),
    );
  }
}
