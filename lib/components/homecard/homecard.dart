import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app/models/places.dart';
import 'package:travel_app/screens/detailsscreen.dart';

class Homecardcomp extends StatelessWidget {
  const Homecardcomp({super.key, required data}) : _data = data;
  final Places _data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1,
        surfaceTintColor: Colors.transparent,
        color: Theme.of(context).colorScheme.background,
        shadowColor:
            Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
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
              height: 260,
              width: 270,
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
                              arguments: {
                                "tag": _data.id,
                                "image": _data.imageSrc[0]
                              },
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: _data.id,
                        child: Image.network(
                          errorBuilder: (context, error, stackTrace) {
                            return SizedBox(
                              width: 270,
                              height: 200,
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
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress != null) {
                              return SizedBox(
                                width: 270,
                                height: 200,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.red,
                                  highlightColor: Colors.yellow,
                                  child: Container(
                                    height: 170,
                                    color: Colors.white24,
                                  ),
                                ),
                              );
                            }
                            return child;
                          },
                          _data.imageSrc[0],
                          width: 270,
                          height: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                _data.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  size: 18,
                                  color: Colors.orange,
                                ),
                                Text(
                                  _data.location,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                )
                              ],
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
                            Text(_data.rating)
                          ],
                        )
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
