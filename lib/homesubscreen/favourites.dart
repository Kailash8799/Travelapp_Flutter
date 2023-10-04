import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/components/cities/citiescard.dart';
import 'package:travel_app/components/cities/citiescardloading.dart';
import 'package:travel_app/components/counties/countriescard.dart';
import 'package:travel_app/components/counties/countryloadingcard.dart';
import 'package:travel_app/components/topplace/topplacehome.dart';
import 'package:travel_app/components/topplace/topplceloading.dart';
import 'package:travel_app/screens/homescreen.dart';

class Favouritepage extends StatefulWidget {
  const Favouritepage({super.key});

  @override
  State<Favouritepage> createState() => _FavouritepageState();
}

class _FavouritepageState extends State<Favouritepage> {
  StreamSubscription? connectiontrip;
  bool isOffline = true;
  void checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile) {
      setState(() {
        isOffline = false;
      });
    } else if (result == ConnectivityResult.wifi) {
      setState(() {
        isOffline = false;
      });
    } else if (result == ConnectivityResult.ethernet) {
      setState(() {
        isOffline = false;
      });
    } else if (result == ConnectivityResult.bluetooth) {
      setState(() {
        isOffline = false;
      });
    } else if (result == ConnectivityResult.none) {
      setState(() {
        isOffline = true;
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
          isOffline = true;
        });
      } else if (result == ConnectivityResult.mobile) {
        //connection is mobile data network
        setState(() {
          isOffline = false;
        });
      } else if (result == ConnectivityResult.wifi) {
        //connection is from wifi
        setState(() {
          isOffline = false;
        });
      } else if (result == ConnectivityResult.ethernet) {
        //connection is from wired connection
        setState(() {
          isOffline = false;
        });
      } else if (result == ConnectivityResult.bluetooth) {
        //connection is from bluetooth threatening
        setState(() {
          isOffline = false;
        });
      }
    });

    super.initState();
  }

  static final topPlaces = [
    {
      "image":
          "https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z29hJTIwYmVhY2h8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
      "location": "Goa, India",
      "placename": "Goa south beach",
      "placereview": "40",
      "tag": "goagood",
      "reviewavatar": [
        "https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z29hJTIwYmVhY2h8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
        "https://images.unsplash.com/photo-1462331940025-496dfbfc7564?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGhvdG98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
        "https://plus.unsplash.com/premium_photo-1676009648296-227e4bdf495a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGhvdG98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"
      ]
    },
    {
      "image":
          "https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z29hJTIwYmVhY2h8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
      "location": "Goa, India",
      "placename": "Goa south beach",
      "placereview": "40",
      "tag": "goabvgood",
      "reviewavatar": [
        "https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z29hJTIwYmVhY2h8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
        "https://images.unsplash.com/photo-1462331940025-496dfbfc7564?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGhvdG98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
        "https://plus.unsplash.com/premium_photo-1676009648296-227e4bdf495a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGhvdG98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"
      ]
    },
    {
      "image":
          "https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z29hJTIwYmVhY2h8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
      "location": "Goa, India",
      "placename": "Goa south beach",
      "placereview": "40",
      "tag": "goagoodv",
      "reviewavatar": [
        "https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z29hJTIwYmVhY2h8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
        "https://images.unsplash.com/photo-1462331940025-496dfbfc7564?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cmFuZG9tJTIwcGhvdG98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60",
        "https://plus.unsplash.com/premium_photo-1676009648296-227e4bdf495a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cmFuZG9tJTIwcGhvdG98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"
      ]
    },
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    connectiontrip!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              title: const Text("Favorites"),
              surfaceTintColor: Colors.transparent,
              leading: BackButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }));
                },
              ),
              centerTitle: true,
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Counties",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 250,
                child: !isOffline
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const Countrycardcomp();
                        },
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const Countryloadingcardcomp();
                        },
                      ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Cities",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 160,
                child: !isOffline
                    ? ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const Citiescardcomp();
                        },
                      )
                    : ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return const Citiesloadingcardcomp();
                        },
                      ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Top places",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Text(
                        "See all",
                        style: TextStyle(
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: SizedBox(
              height: 160,
              child: !isOffline
                  ? ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: topPlaces.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Topplacecomp(
                          image: topPlaces[index]["image"],
                          location: topPlaces[index]["location"],
                          placename: topPlaces[index]["placename"],
                          placereview: topPlaces[index]["placereview"],
                          reviewavatar: topPlaces[index]["reviewavatar"],
                          tag: "${topPlaces[index]["tag"]}$index",
                        );
                      },
                    )
                  : ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return const Topplaceloadingcomp();
                      },
                    ),
            ))
          ],
        ),
      ),
    );
  }
}
