import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app/screens/hoteldetailsscreen.dart';

class HotelCardcomp extends StatefulWidget {
  const HotelCardcomp({
    super.key,
    doublebed,
    hotelImage,
    hotelname,
    hotelspecification,
    hotelrent,
    isAc,
    isBath,
    hotelstar,
    likedper,
    tag,
  })  : _doublebed = doublebed,
        _hotelImage = hotelImage,
        _hotelname = hotelname,
        _hotelspecification = hotelspecification,
        _hotelrent = hotelrent,
        _isAc = isAc,
        _tag = tag,
        _hotelstar = hotelstar,
        _likedper = likedper,
        _isBath = isBath;
  final String _hotelImage;
  final String _hotelname;
  final String _hotelspecification;
  final int _hotelrent;
  final int _doublebed;
  final bool _isAc;
  final bool _isBath;
  final String _tag;
  final int _hotelstar;
  final int _likedper;

  @override
  State<HotelCardcomp> createState() => _HotelCardcompState();
}

class _HotelCardcompState extends State<HotelCardcomp> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const Hoteldetailscreen();
            },
            settings: RouteSettings(
              arguments: {
                "tag": widget._tag,
                "image": widget._hotelImage,
              },
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        height: 350,
        child: Card(
          elevation: 0.4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: Stack(children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Hero(
                      tag: widget._tag,
                      child: Image.network(
                        errorBuilder: (context, error, stackTrace) {
                          return SizedBox(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            child: Shimmer.fromColors(
                              baseColor: Colors.red,
                              highlightColor: Colors.yellow,
                              child: Container(
                                height: 200,
                                color: Colors.white24,
                              ),
                            ),
                          );
                        },
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress != null) {
                            return SizedBox(
                              height: 200,
                              width: MediaQuery.of(context).size.width,
                              child: Shimmer.fromColors(
                                baseColor: Colors.red,
                                highlightColor: Colors.yellow,
                                child: Container(
                                  height: 200,
                                  color: Colors.white24,
                                ),
                              ),
                            );
                          } else {
                            return child;
                          }
                        },
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                        height: 200,
                        widget._hotelImage,
                      ),
                    ),
                  ),
                  Positioned(
                      left: 10,
                      bottom: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget._hotelname.length > 26
                                ? "${widget._hotelname.substring(0, 25)}..."
                                : widget._hotelname,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                          Row(children: [
                            Text(
                              "${widget._hotelstar} start hotel • ${widget._likedper}% ",
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            const Icon(
                              Icons.thumb_up,
                              size: 16,
                              color: Colors.white,
                            )
                          ]),
                        ],
                      ))
                ]),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                child: Text(
                  widget._hotelspecification,
                  style: const TextStyle(
                    fontSize: 17,
                  ),
                ),
              ),
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.auto_graph_outlined,
                            size: 16,
                          ),
                          Text(
                            "12 m\u00b2",
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.king_bed_outlined,
                            size: 16,
                          ),
                          Text("${widget._doublebed} double bed")
                        ],
                      ),
                      const Row(
                        children: [
                          Icon(
                            Icons.ac_unit_outlined,
                            size: 15,
                          ),
                          Text("AC")
                        ],
                      ),
                      widget._isBath
                          ? const Row(
                              children: [
                                Icon(
                                  Icons.bathroom_outlined,
                                  size: 15,
                                ),
                                Text("bath")
                              ],
                            )
                          : const Row(),
                    ],
                  )),
              const Expanded(
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.wifi,
                              size: 16,
                            ),
                            Text(
                              "free Wi-Fi",
                              style: TextStyle(fontFamily: "Quicksand"),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.king_bed_outlined,
                              size: 16,
                            ),
                            Text(
                              "television",
                              style: TextStyle(fontFamily: "Quicksand"),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.ac_unit_outlined,
                              size: 15,
                            ),
                            Text(
                              "ironing facilities",
                              style: TextStyle(fontFamily: "Quicksand"),
                            )
                          ],
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget._hotelrent}/per night",
                      style: TextStyle(fontSize: 17),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text(
                        "Book now",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
