import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app/components/bookingall/booking.dart';
import 'package:travel_app/components/imagecarousel/carousel.dart';
import 'package:travel_app/models/listing.dart';

class Hoteldetailpage extends StatefulWidget {
  const Hoteldetailpage({super.key, data}) : _data = data;
  final Listing _data;

  @override
  State<Hoteldetailpage> createState() => _HoteldetailpageState();
}

class _HoteldetailpageState extends State<Hoteldetailpage> {
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();
  bool showMap = false;
  Timer? time;
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(22.677612754699826, 72.88234901045453),
    zoom: 14.4746,
  );

  void delaymap() {
    time = Timer(const Duration(seconds: 4), () {
      setState(() {
        showMap = true;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    delaymap();
  }

  @override
  void dispose() {
    time!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 0.17,
              color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
            ),
          ),
        ),
        child: BottomAppBar(
            height: 70,
            surfaceTintColor: Colors.transparent,
            color: Theme.of(context).colorScheme.background,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "₹${widget._data.price} night",
                        style: TextStyle(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(1),
                          fontSize: 20,
                        ),
                      ),
                    ]),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                      builder: (context) {
                        return const Bookingscreen();
                      },
                    ));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    fixedSize: const Size(120, 90),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Book",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                )
              ],
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Imagecarousel(id: widget._data.id, images: widget._data.imageSrc),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget._data.title,
                      style: TextStyle(
                        fontSize: 24,
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          FontAwesomeIcons.locationDot,
                          color: Colors.orange,
                          size: 17,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, top: 3),
                          child: Text(
                            widget._data.country,
                            style: TextStyle(
                                fontSize: 17,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimary
                                    .withAlpha(130)),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Divider(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.1),
                        thickness: 0.4,
                        height: 10,
                      ),
                    ),
                    Text(
                      widget._data.description,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Quicksand',
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 0),
                      child: Divider(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.1),
                        thickness: 0.4,
                      ),
                    ),
                    Text(
                      "What this place offers",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Quicksand',
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(1),
                      ),
                    ),
                    SizedBox(
                      child: ListView.builder(
                        padding: const EdgeInsets.all(0),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: widget._data.facilities.length,
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 6),
                                child: Icon(
                                  Icons.wifi,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimary
                                      .withOpacity(0.4),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 3, vertical: 6),
                                child: Text(
                                  widget._data.facilities[index].fav,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Quicksand',
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary
                                        .withOpacity(1),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Divider(
                        color: Theme.of(context)
                            .colorScheme
                            .onPrimary
                            .withOpacity(0.1),
                        thickness: 0.4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Text(
                        "Where you'll be",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Quicksand',
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(1),
                        ),
                      ),
                    ),
                    showMap
                        ? SizedBox(
                            height: 300,
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              child: GoogleMap(
                                mapType: MapType.normal,
                                zoomGesturesEnabled: true,
                                zoomControlsEnabled: true,
                                initialCameraPosition: _kGooglePlex,
                                onMapCreated: (GoogleMapController controller) {
                                  _controller.complete(controller);
                                },
                                myLocationEnabled: true,
                                compassEnabled: true,
                              ),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: SizedBox(
                              height: 300,
                              child: Shimmer(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFEBEBF4),
                                    Color(0xFFF4F4F4),
                                    Color(0xFFEBEBF4),
                                  ],
                                  stops: [
                                    0.1,
                                    0.3,
                                    0.4,
                                  ],
                                  begin: Alignment(-1.0, -0.3),
                                  end: Alignment(1.0, 0.3),
                                  tileMode: TileMode.clamp,
                                ),
                                child: Container(
                                  height: 300,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
