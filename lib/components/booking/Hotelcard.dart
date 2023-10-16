// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app/models/listing.dart';
import 'package:travel_app/screens/hoteldetailsscreen.dart';

class HotelCardcomp extends StatelessWidget {
  const HotelCardcomp({super.key, required data}) : _data = data;
  final Listingmodel _data;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const Hoteldetailscreen();
            },
            settings: RouteSettings(
              arguments: _data,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 350,
        child: Card(
          elevation: 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Hero(
                      tag: _data.id,
                      child: CachedNetworkImage(
                        placeholder: (context, url) {
                          return SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Shimmer.fromColors(
                              baseColor: Colors.red,
                              highlightColor: Colors.yellow,
                              child: Container(
                                height: 200,
                                color: Colors.white24,
                              ),
                            ),
                          );
                        },
                        errorWidget: (context, url, error) {
                          return SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Shimmer.fromColors(
                              baseColor: Colors.red,
                              highlightColor: Colors.yellow,
                              child: Container(
                                height: 200,
                                color: Colors.white24,
                              ),
                            ),
                          );
                        },
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        imageUrl: _data.imageSrc[0],
                      ),
                    ),
                  ),
                  Positioned(
                      left: 10,
                      bottom: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _data.title.length > 26
                                ? "${_data.title.substring(0, 25)}..."
                                : _data.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Row(children: [
                            Text(
                              "${_data.rating} start hotel • ${_data.rating * 10}% ",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const Icon(
                              Icons.thumb_up,
                              size: 16,
                              color: Colors.white,
                            )
                          ]),
                        ],
                      ))
                ]),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Text(
                  _data.hotelspecification,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.auto_graph_outlined,
                            size: 16,
                          ),
                          Text(
                            "12 m\u00b2",
                          )
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.king_bed_outlined,
                            size: 16,
                          ),
                          Text("2 double bed")
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.ac_unit_outlined,
                            size: 15,
                          ),
                          Text("AC")
                        ],
                      ),
                      // ignore: unnecessary_null_comparison
                      _data.country != null
                          ? const Row(
                              children: [
                                Icon(
                                  Icons.bathroom_outlined,
                                  size: 15,
                                ),
                                Text("bath")
                              ],
                            )
                          : const Row(),
                    ],
                  )),
              const Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.wifi,
                              size: 16,
                            ),
                            Text(
                              "free Wi-Fi",
                              style: TextStyle(fontFamily: "Quicksand"),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.king_bed_outlined,
                              size: 16,
                            ),
                            Text(
                              "television",
                              style: TextStyle(fontFamily: "Quicksand"),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.ac_unit_outlined,
                              size: 15,
                            ),
                            Text(
                              "ironing facilities",
                              style: TextStyle(fontFamily: "Quicksand"),
                            )
                          ],
                        ),
                      ],
                    )),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹${_data.price}/night",
                      style: const TextStyle(fontSize: 17),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
