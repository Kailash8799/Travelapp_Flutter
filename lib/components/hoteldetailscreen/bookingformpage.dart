import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app/models/listing.dart';
import 'package:travel_app/homesubscreen/booking.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Hotelbookformpage extends StatelessWidget {
  const Hotelbookformpage({super.key, required data}) : _data = data;
  final Listing _data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 1,
          surfaceTintColor: Colors.transparent,
          color: Theme.of(context).colorScheme.background,
          shadowColor:
              Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
          child: SizedBox(
            height: 300,
            child: Column(
              children: [
                Stack(children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl: _data.imageSrc[0],
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SizedBox(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: Shimmer.fromColors(
                          baseColor: Colors.red,
                          highlightColor: Colors.yellow,
                          child: Container(
                            height: 150,
                            color: Colors.white24,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => SizedBox(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: Shimmer.fromColors(
                          baseColor: Colors.red,
                          highlightColor: Colors.yellow,
                          child: Container(
                            height: 150,
                            color: Colors.white24,
                            child: const Center(
                              child: Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 10,
                      bottom: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _data.hotelspecification.length > 26
                                ? "${_data.hotelspecification.substring(0, 25)}..."
                                : _data.hotelspecification,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ))
                ]),
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                    itemCount: _data.facilities.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Chip(label: Text(_data.facilities[index].fav));
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: MySeparator(color: Colors.grey[300]!),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
