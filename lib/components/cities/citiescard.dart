import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

class Citiescardcomp extends StatefulWidget {
  const Citiescardcomp({super.key});

  @override
  State<Citiescardcomp> createState() => _CitiescardcompState();
}

class _CitiescardcompState extends State<Citiescardcomp> {
  bool isLiked = true;
  final countryrating = 4;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Card(
          elevation: 0.4,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            child: Column(
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: 100,
                      width: 160,
                      child: Column(children: [
                        Image.network(
                            errorBuilder: (context, error, stackTrace) {
                          return SizedBox(
                            height: 100,
                            width: 170,
                            child: Shimmer.fromColors(
                              baseColor: Colors.red,
                              highlightColor: Colors.yellow,
                              child: Container(
                                height: 100,
                                color: Colors.white24,
                              ),
                            ),
                          );
                        }, loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress != null) {
                            return SizedBox(
                              height: 100,
                              width: 170,
                              child: Shimmer.fromColors(
                                baseColor: Colors.red,
                                highlightColor: Colors.yellow,
                                child: Container(
                                  height: 100,
                                  color: Colors.white24,
                                ),
                              ),
                            );
                          }
                          return child;
                        },
                            width: 170,
                            height: 100,
                            fit: BoxFit.cover,
                            "https://wallpaperaccess.com/full/1821296.jpg")
                      ]),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      child: IconButton(
                        onPressed: () {},
                        icon: const FaIcon(
                          FontAwesomeIcons.solidHeart,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 160,
                        alignment: Alignment.bottomCenter,
                        child: const Text(
                          "Dubai",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                  width: 160,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(5, (index) {
                          return Icon(
                            index < countryrating
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                          );
                        }),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
