import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app/components/detailscreen/detailpage.dart';
import 'package:travel_app/models/places.dart';
import 'package:travel_app/services/getplaces.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    dynamic data = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        excludeHeaderSemantics: true,
        toolbarHeight: 38,
        leading: const BackButton(color: Colors.white),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: Colors.white,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 4, left: 5, right: 15),
            child: LikeButton(
              size: 27,
              likeBuilder: (isLiked) {
                return Icon(
                  FontAwesomeIcons.solidHeart,
                  color: isLiked ? Colors.pink : Colors.white,
                  size: 26,
                );
              },
            ),
          ),
        ],
      ),
      body: FutureBuilder(
        future: HomePlaces.getPlacesById(data?["tag"]),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return GestureDetector(
              child: Hero(
                tag: data?["tag"],
                child: CarouselSlider.builder(
                  options: CarouselOptions(
                    height: 250,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {},
                  ),
                  itemCount: 2,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Image.network(
                    data?["image"],
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
            );
          } else {
            if (snapshot.hasData && snapshot.data!.length == 1) {
              return Placedetailpage(data: Places.fromJson(snapshot.data![0]));
            } else {
              return GestureDetector(
                child: Hero(
                  tag: data?["tag"],
                  child: CarouselSlider.builder(
                    options: CarouselOptions(
                      height: 250,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {},
                    ),
                    itemCount: 2,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Image.network(
                      data?["image"],
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
              );
            }
          }
        },
      ),
    );
  }
}
