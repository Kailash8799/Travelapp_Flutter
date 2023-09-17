import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:like_button/like_button.dart';
import 'package:travel_app/components/detailscreen/detailpage.dart';

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
        surfaceTintColor: Colors.transparent,
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
      body: Placedetailpage(data: data),
    );
  }
}
