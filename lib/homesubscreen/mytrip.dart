import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/components/mytriphome/completed/completedtab.dart';
import 'package:travel_app/components/mytriphome/triploading.dart';
import 'package:travel_app/components/mytriphome/upcoming/upcomingtab.dart';
import 'package:travel_app/components/mytriphome/upcomingtripcard.dart';
import 'package:travel_app/screens/homescreen.dart';

class Mytrippage extends StatefulWidget {
  const Mytrippage({super.key});

  @override
  State<Mytrippage> createState() => _MytrippageState();
}

class _MytrippageState extends State<Mytrippage>
    with SingleTickerProviderStateMixin {
  StreamSubscription? connectiontrip;
  late TabController _tabbarcontroller;
  bool isTripoffline = true;
  void checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if (result == ConnectivityResult.mobile) {
      setState(() {
        isTripoffline = false;
      });
    } else if (result == ConnectivityResult.wifi) {
      setState(() {
        isTripoffline = false;
      });
    } else if (result == ConnectivityResult.ethernet) {
      setState(() {
        isTripoffline = false;
      });
    } else if (result == ConnectivityResult.bluetooth) {
      setState(() {
        isTripoffline = false;
      });
    } else if (result == ConnectivityResult.none) {
      setState(() {
        isTripoffline = true;
      });
    }
  }

  @override
  void initState() {
    _tabbarcontroller = TabController(length: 2, vsync: this);
    checkConnectivity();
    connectiontrip = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // whenevery connection status is changed.
      if (result == ConnectivityResult.none) {
        //there is no any connection
        setState(() {
          isTripoffline = true;
        });
      } else if (result == ConnectivityResult.mobile) {
        //connection is mobile data network
        setState(() {
          isTripoffline = false;
        });
      } else if (result == ConnectivityResult.wifi) {
        //connection is from wifi
        setState(() {
          isTripoffline = false;
        });
      } else if (result == ConnectivityResult.ethernet) {
        //connection is from wired connection
        setState(() {
          isTripoffline = false;
        });
      } else if (result == ConnectivityResult.bluetooth) {
        //connection is from bluetooth threatening
        setState(() {
          isTripoffline = false;
        });
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _tabbarcontroller.dispose();
    super.dispose();
    connectiontrip!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: const Text("My Trips"),
          centerTitle: true,
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(100)),
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                padding:
                    const EdgeInsets.only(bottom: 4, left: 4, right: 4, top: 4),
                child: TabBar(
                  unselectedLabelColor: Colors.white,
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white,
                  ),
                  indicatorColor: Colors.transparent,
                  dividerColor: Colors.transparent,
                  indicatorSize: TabBarIndicatorSize.tab,
                  splashFactory: NoSplash.splashFactory,
                  labelColor: Colors.black,
                  controller: _tabbarcontroller,
                  tabs: const [
                    Tab(
                      child: Text(
                        "Upcoming",
                        style: TextStyle(fontSize: 17),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Completed",
                        style: TextStyle(fontSize: 17),
                      ),
                    )
                  ],
                ),
              )),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
        ),
        body: TabBarView(controller: _tabbarcontroller, children: [
          SafeArea(
            child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  !isTripoffline
                      ? const Upcomingtab()
                      : const SliverToBoxAdapter(
                          child: Column(
                            children: [
                              MyupcomingtripLoading(),
                              MyupcomingtripLoading(),
                              MyupcomingtripLoading(),
                              MyupcomingtripLoading(),
                              MyupcomingtripLoading(),
                              MyupcomingtripLoading(),
                            ],
                          ),
                        ),
                ]),
          ),
          SafeArea(
            child: CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  !isTripoffline
                      ? const Completedtab()
                      : const SliverToBoxAdapter(
                          child: Column(
                            children: [
                              MyupcomingtripLoading(),
                              MyupcomingtripLoading(),
                              MyupcomingtripLoading(),
                              MyupcomingtripLoading(),
                              MyupcomingtripLoading(),
                              MyupcomingtripLoading(),
                            ],
                          ),
                        ),
                ]),
          ),
        ]));
  }
}
