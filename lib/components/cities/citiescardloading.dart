import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Citiesloadingcardcomp extends StatelessWidget {
  const Citiesloadingcardcomp({super.key});

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
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  child: SizedBox(
                    height: 100,
                    width: 170,
                    child: Shimmer.fromColors(
                      baseColor: Colors.red,
                      highlightColor: Colors.yellow,
                      child: Container(
                        height: 200,
                        color: Colors.white24,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                    height: 40,
                    width: 160,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 2),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                              child: SizedBox(
                                height: 20,
                                width: 170,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.red,
                                  highlightColor: Colors.yellow,
                                  child: Container(
                                    height: 20,
                                    color: Colors.white24,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ]))
              ],
            ),
          )),
    );
  }
}
