import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app/models/places.dart';

class Imagecarousel extends StatefulWidget {
  const Imagecarousel({super.key, data}) : _data = data;
  final Places _data;

  @override
  State<Imagecarousel> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Imagecarousel> {
  static int _currentImageIndex = 1;
  void changeIndex(int index) {
    setState(() {
      _currentImageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentImageIndex = 1;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _currentImageIndex = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          child: Hero(
            tag: widget._data.id,
            child: CarouselSlider.builder(
              options: CarouselOptions(
                height: 250,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                onPageChanged: (index, reason) {
                  changeIndex(index + 1);
                },
              ),
              itemCount: widget._data.imageSrc.length,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Image.network(
                widget._data.imageSrc[itemIndex],
                width: MediaQuery.of(context).size.width + 100,
                height: 250,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return SizedBox(
                    height: 250,
                    child: Shimmer.fromColors(
                      baseColor: Colors.red,
                      highlightColor: Colors.yellow,
                      child: Container(
                        height: 250,
                        color: Colors.white24,
                      ),
                    ),
                  );
                },
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return SizedBox(
                      height: 250,
                      child: Shimmer.fromColors(
                        baseColor: Colors.red,
                        highlightColor: Colors.yellow,
                        child: Container(
                          height: 250,
                          color: Colors.white24,
                        ),
                      ),
                    );
                  }
                  return child;
                },
              ),
            ),
          ),
        ),
        Positioned(
          right: 20,
          bottom: 10,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey[100]!.withOpacity(0.5),
                borderRadius: BorderRadius.circular(3)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              child: Row(
                children: [
                  Text("$_currentImageIndex",
                      style: const TextStyle(color: Colors.white)),
                  const Text(" / ", style: TextStyle(color: Colors.white)),
                  Text("${widget._data.imageSrc.length}",
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
