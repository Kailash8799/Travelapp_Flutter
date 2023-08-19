import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:travel_app/screens/detailsscreen.dart';

class Homecardcomp extends StatelessWidget {
  const Homecardcomp({super.key, tag, location, image, placename, placerating})
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1,
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
                              arguments: {"tag": _tag, "image": _image},
                            ),
                          ),
                        );
                      },
                      child: Hero(
                        tag: _tag,
                        child: Image.network(
                          _image,
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
                            Row(
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
