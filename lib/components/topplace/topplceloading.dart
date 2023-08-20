import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Topplaceloadingcomp extends StatelessWidget {
  const Topplaceloadingcomp({super.key});

  static final List<int> _reviewavtar = [1, 2, 3, 4];
  static const dynamic position = [0.0, 15.0, 30.0, 45.0];
  Widget avatar(int img) {
    int ind = _reviewavtar.indexOf(img);
    double leftp = position[ind];
    return Positioned(
      left: leftp,
      child: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 232, 173, 169),
        maxRadius: 14,
        minRadius: 14,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          child: SizedBox(
            height: 28.0,
            width: 28,
            child: Shimmer.fromColors(
              baseColor: Colors.red,
              highlightColor: Colors.yellow,
              child: Container(
                height: 28,
                width: 28,
                color: Colors.white24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
              tileMode: TileMode.clamp,
            ),
            child: SizedBox(
              height: 150,
              width: 325,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Shimmer.fromColors(
                      baseColor: Colors.red,
                      highlightColor: Colors.yellow,
                      child: Container(
                        height: 150,
                        width: 150,
                        color: Colors.white24,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 4),
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          child: SizedBox(
                            height: 30.0,
                            width: 100,
                            child: Shimmer.fromColors(
                              baseColor: Colors.red,
                              highlightColor: Colors.yellow,
                              child: Container(
                                height: 30,
                                width: 100,
                                color: Colors.white24,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, top: 4),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                height: 30.0,
                                width: 100,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.red,
                                  highlightColor: Colors.yellow,
                                  child: Container(
                                    height: 30,
                                    width: 100,
                                    color: Colors.white24,
                                  ),
                                ),
                              ),
                            ),
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
                                ],
                              ),
                            ),
                          ),
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            child: SizedBox(
                              height: 30.0,
                              width: 80,
                              child: Shimmer.fromColors(
                                baseColor: Colors.red,
                                highlightColor: Colors.yellow,
                                child: Container(
                                  height: 30,
                                  width: 80,
                                  color: Colors.white24,
                                ),
                              ),
                            ),
                          ),
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
    );
  }
}
