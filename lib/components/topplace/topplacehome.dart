import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app/screens/detailsscreen.dart';

class Topplacecomp extends StatelessWidget {
  const Topplacecomp(
      {super.key, tag, location, image, placename, placereview, reviewavatar})
      : _image = image,
        _tag = tag,
        _location = location,
        _placename = placename,
        _placereview = placereview,
        _reviewavtar = reviewavatar;
  final String _tag;
  final String _location;
  final String _image;
  final String _placename;
  final String _placereview;
  final List<String> _reviewavtar;
  static const dynamic position = [0.0, 15.0, 30.0];
  Widget avatar(String img) {
    int ind = _reviewavtar.indexOf(img);
    double leftp = position[ind];
    return Positioned(
      left: leftp,
      child: CircleAvatar(
        backgroundColor: Colors.pink,
        backgroundImage: NetworkImage(img),
        maxRadius: 14,
        minRadius: 14,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1,
        surfaceTintColor: Colors.transparent,
        color: Theme.of(context).colorScheme.background,
        shadowColor:
            Theme.of(context).colorScheme.onBackground.withOpacity(0.4),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
              tileMode: TileMode.clamp,
            ),
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
              child: SizedBox(
                height: 150,
                width: 325,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Hero(
                      tag: _tag,
                      child: CachedNetworkImage(
                        imageUrl: _image,
                        placeholder: (context, url) {
                          return SizedBox(
                            width: 150,
                            height: 150,
                            child: Shimmer.fromColors(
                              baseColor: Colors.red,
                              highlightColor: Colors.yellow,
                              child: Container(
                                height: 170,
                                color: Colors.white24,
                              ),
                            ),
                          );
                        },
                        errorWidget: (context, url, error) {
                          return SizedBox(
                            width: 150,
                            height: 150,
                            child: Shimmer.fromColors(
                              baseColor: Colors.red,
                              highlightColor: Colors.yellow,
                              child: Container(
                                height: 170,
                                color: Colors.white24,
                              ),
                            ),
                          );
                        },
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          padding: const EdgeInsets.only(left: 10),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.location_on,
                                size: 18,
                                color: Colors.orange,
                              ),
                              Text(
                                _location,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, top: 10),
                              child: SizedBox(
                                width: 80,
                                height: 40,
                                child: Stack(
                                  children: [
                                    Stack(
                                      children: _reviewavtar
                                          .map((e) => avatar(e))
                                          .toList(),
                                    ),
                                    const Positioned(
                                      left: 45,
                                      child: CircleAvatar(
                                        maxRadius: 14,
                                        minRadius: 14,
                                        backgroundColor: Colors.purple,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              "$_placereview reviews",
                              style: TextStyle(fontSize: 13),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
