import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';

class Countrycardcomp extends StatefulWidget {
  const Countrycardcomp({super.key});

  @override
  State<Countrycardcomp> createState() => _CountrycardcompState();
}

class _CountrycardcompState extends State<Countrycardcomp> {
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
                      height: 170,
                      width: 160,
                      child: Column(children: [
                        Image.network(
                            errorBuilder: (context, error, stackTrace) {
                          return SizedBox(
                            height: 170,
                            width: 170,
                            child: Shimmer.fromColors(
                              baseColor: Colors.red,
                              highlightColor: Colors.yellow,
                              child: Container(
                                height: 170,
                                color: Colors.white24,
                              ),
                            ),
                          );
                        }, loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress != null) {
                            return SizedBox(
                              height: 170,
                              width: 170,
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
                            width: 170,
                            height: 170,
                            fit: BoxFit.cover,
                            "https://images.unsplash.com/photo-1626606076701-cf4ae64b2b03?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1332&q=80")
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
                  ],
                ),
                SizedBox(
                    height: 60,
                    width: 160,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Dubai"),
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
                        ]))
              ],
            ),
          )),
    );
  }
}
