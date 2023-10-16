// ignore_for_file: file_names

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app/models/reservation.dart';

class Hotelbooktripcard extends StatelessWidget {
  const Hotelbooktripcard({super.key, required data}) : _data = data;
  final Reservationmodel _data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 300,
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
                    imageUrl: _data.tripcoverimage,
                  ),
                ),
                Positioned(
                    left: 10,
                    bottom: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _data.tripname.length > 26
                              ? "${_data.tripname.substring(0, 25)}..."
                              : _data.tripname,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ],
                    ))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              child: Text(
                _data.destinationname,
                style: const TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        DateFormat.yMMMEd().format(_data.startDate),
                        style: const TextStyle(fontFamily: "Quicksand"),
                      ),
                      const Text(
                        "--------",
                        style: TextStyle(fontFamily: "Quicksand"),
                      ),
                      Text(
                        DateFormat.yMMMEd().format(_data.enddate),
                        style: const TextStyle(fontFamily: "Quicksand"),
                      ),
                    ],
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "₹${_data.totalprice}/ ${_data.enddate.difference(_data.startDate).inDays} nights",
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
