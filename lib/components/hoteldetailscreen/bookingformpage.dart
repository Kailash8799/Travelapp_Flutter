import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app/components/hoteldetailscreen/paymentdetail.dart';
import 'package:travel_app/models/listing.dart';
import 'package:travel_app/homesubscreen/booking.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Hotelbookformpage extends StatefulWidget {
  const Hotelbookformpage({super.key, required data, required bookingrange})
      : _data = data,
        _bookingrange = bookingrange;
  final Listingmodel _data;
  final DateTimeRange _bookingrange;

  @override
  State<Hotelbookformpage> createState() => _HotelbookformpageState();
}

class _HotelbookformpageState extends State<Hotelbookformpage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool checkbox = false;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          elevation: 1,
          surfaceTintColor: Colors.transparent,
          color: Theme.of(context).colorScheme.background,
          shadowColor:
              Theme.of(context).colorScheme.onBackground.withOpacity(0.3),
          child: SizedBox(
            height: 290,
            child: Column(
              children: [
                Stack(children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                      imageUrl: widget._data.imageSrc[0],
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => SizedBox(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: Shimmer.fromColors(
                          baseColor: Colors.red,
                          highlightColor: Colors.yellow,
                          child: Container(
                            height: 150,
                            color: Colors.white24,
                          ),
                        ),
                      ),
                      errorWidget: (context, url, error) => SizedBox(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: Shimmer.fromColors(
                          baseColor: Colors.red,
                          highlightColor: Colors.yellow,
                          child: Container(
                            height: 150,
                            color: Colors.white24,
                            child: const Center(
                              child: Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 10,
                      bottom: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget._data.hotelspecification.length > 26
                                ? "${widget._data.hotelspecification.substring(0, 25)}..."
                                : widget._data.hotelspecification,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              overflow: TextOverflow.fade,
                            ),
                          ),
                        ],
                      ))
                ]),
                SizedBox(
                  height: 35,
                  child: ListView.builder(
                    itemCount: widget._data.facilities.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        child: Row(
                          children: [
                            widget._data.facilities[index].icon == "AC"
                                ? const Icon(FontAwesomeIcons.airbnb)
                                : const Text(""),
                            Text(
                              widget._data.facilities[index].fav,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: MySeparator(color: Colors.grey[300]!),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Price"),
                      Text("\$${widget._data.price}"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: MySeparator(color: Colors.grey[300]!),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Tex"),
                      Text("\$${widget._data.price}"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: MySeparator(color: Colors.grey[300]!),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total"),
                      Text("\$${widget._data.price}"),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Form(
          key: _formKey,
          child: Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 15,
                  ),
                  child: Text("Full Name"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextFormField(
                    controller: _name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter your name";
                      } else if (value.length < 3) {
                        return "Enter minimun 3 character name";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                      hintText: "Your name",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      color: Colors.grey[700]!,
                      fontSize: 15,
                      height: 1,
                    ),
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.only(left: 15, right: 15, top: 15, bottom: 5),
                  child: Text("Email"),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0),
                  child: TextFormField(
                    controller: _email,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 6) {
                        return "Invalid email";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                      hintText: "Email",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      color: Colors.grey[700]!,
                      fontSize: 15,
                      height: 1,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: checkbox,
                      onChanged: (value) {
                        setState(() {
                          checkbox = value!;
                        });
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 0),
                      child: Text("Use my profile email"),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return Hotelpaymentdetails(
                            data: widget._data,
                            email: _email.text,
                            name: _name.text,
                            checkmark: checkbox,
                            daterange: widget._bookingrange,
                          );
                        }));
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        backgroundColor: Colors.orange),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
