import 'dart:ui';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';

class Myupcomingtrip extends StatelessWidget {
  const Myupcomingtrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
        top: 5,
        bottom: 0,
      ),
      child: Card(
        elevation: 0.3,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            child: Container(
              height: 170,
              child: Row(children: [
                Image.network(
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress != null) {
                      return SizedBox(
                        width: 130.0,
                        height: 170.0,
                        child: Shimmer.fromColors(
                          baseColor: Colors.red,
                          highlightColor: Colors.yellow,
                          child: Container(
                            width: 130,
                            height: 170,
                            color: Colors.white24,
                          ),
                        ),
                      );
                    }
                    // if(context.)
                    return child;
                  },
                  "https://cdn.pixabay.com/photo/2018/04/25/09/26/eiffel-tower-3349075_1280.jpg",
                  height: 170,
                  width: 130,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: []),
                    Text("1 hr 55 min", style: TextStyle(background: Paint())),
                    Row(children: []),
                    Text(
                      "12 wayponts",
                      style: TextStyle(background: Paint()),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
