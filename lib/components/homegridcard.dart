import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/screens/detailsscreen.dart';

class Homegridcardcomp extends StatelessWidget {
  const Homegridcardcomp(
      {super.key, tag, location, image, placename, placerating})
      : _image = image,
        _tag = tag,
        _location = location,
        _placename = placename,
        _placerating = placerating;
  final String _tag;
  final String _location;
  final String _image;
  final String _placename;
  final String _placerating;
  static List<String> images = [
    "https://images.unsplash.com/photo-1626606076701-cf4ae64b2b03?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1332&q=80",
    "https://images.unsplash.com/photo-1512343879784-a960bf40e7f2?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Z29hJTIwYmVhY2h8ZW58MHx8MHx8fDA%3D&w=1000&q=80"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 0.6,
        color: Colors.white,
        shadowColor: Colors.white,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: SizedBox(
              height: 360,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const DetailScreen();
                            },
                            settings: RouteSettings(
                              arguments: {"tag": _tag, "image": _image},
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: _tag,
                        // Image.network(
                        //   _image,
                        //   height: 250,
                        //   fit: BoxFit.cover,
                        // ),
                        child: CarouselSlider.builder(
                          options: CarouselOptions(
                              height: 250,
                              // autoPlay: true,
                              viewportFraction: 1),
                          itemCount: images.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              Image.network(
                            images[itemIndex],
                            width: MediaQuery.of(context).size.width + 100,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    _placename,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 18,
                                        color: Colors.orange,
                                      ),
                                      RichText(
                                          text: TextSpan(
                                        text: _location,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.color,
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.orange,
                                ),
                                Text(_placerating)
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 12,
                            top: 2,
                            bottom: 3,
                          ),
                          child: RichText(
                              text: TextSpan(
                            text: "Aug 20 - 25",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color:
                                  Theme.of(context).textTheme.titleLarge?.color,
                            ),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "₹1500 ",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 17,
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.color,
                                    )),
                                TextSpan(
                                  text: "night",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
