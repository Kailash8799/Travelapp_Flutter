import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/components/bookingall/flightsearchpage.dart';
import 'package:travel_app/components/widget/snakbar.dart';

class Flightbookingpage extends StatefulWidget {
  const Flightbookingpage({super.key});

  @override
  State<Flightbookingpage> createState() => _FlightbookingpageState();
}

class _FlightbookingpageState extends State<Flightbookingpage> {
  static int _selected = 0;
  int _adult = 0;
  int _children = 0;
  final TextEditingController _departure = TextEditingController();
  final TextEditingController _destination = TextEditingController();
  DateTime? flyOut;
  DateTime? flyBack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        _selected = 0;
                      });
                    },
                    child: Chip(
                      surfaceTintColor: Colors.transparent,
                      side: BorderSide(
                          width: 0,
                          color: _selected == 0
                              ? Theme.of(context).colorScheme.background
                              : Theme.of(context).colorScheme.onPrimary),
                      backgroundColor:
                          _selected == 0 ? Colors.orange : Colors.transparent,
                      label: const Text("One Way"),
                    ),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () {
                      setState(() {
                        _selected = 1;
                      });
                    },
                    child: Chip(
                      surfaceTintColor: Colors.transparent,
                      side: BorderSide(
                          width: 0,
                          color: _selected == 1
                              ? Theme.of(context).colorScheme.background
                              : Theme.of(context).colorScheme.onPrimary),
                      backgroundColor:
                          _selected == 1 ? Colors.orange : Colors.transparent,
                      label: const Text("Return"),
                    ),
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text("Date", style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Theme.of(context).colorScheme.onSecondary),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: InkWell(
                                  onTap: () async {
                                    DateTime? dateOut = await showDatePicker(
                                      context: context,
                                      initialDate:
                                          DateTime(DateTime.now().year),
                                      firstDate: DateTime(DateTime.now().year),
                                      lastDate:
                                          DateTime(DateTime.now().year + 1),
                                    );
                                    if (dateOut != null) {
                                      setState(() {
                                        flyOut = dateOut;
                                        flyBack = null;
                                      });
                                    }
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Fly Out",
                                        style: TextStyle(
                                            fontFamily: "Quicksand",
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        flyOut != null
                                            ? DateFormat('yyyy-MM-dd')
                                                .format(flyOut!)
                                            : "Select Date",
                                        style: const TextStyle(
                                            fontFamily: "Quicksand"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            _selected == 1
                                ? Expanded(
                                    flex: 1,
                                    child: Container(
                                      padding: const EdgeInsets.only(left: 5),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              left: BorderSide(
                                        width: 1,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSecondary,
                                      ))),
                                      child: InkWell(
                                        onTap: () async {
                                          if (flyOut == null) {
                                            showSnakbar(context,
                                                "Please first select flyOut date");
                                            return;
                                          }
                                          DateTime? dateBack =
                                              await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime(
                                                      DateTime.now().year),
                                                  firstDate: DateTime(
                                                      DateTime.now().year),
                                                  lastDate: DateTime(
                                                      DateTime.now().year + 1));
                                          if (dateBack != null) {
                                            if (dateBack
                                                    .difference(flyOut!)
                                                    .inDays >=
                                                0) {
                                              setState(() {
                                                flyBack = dateBack;
                                              });
                                            } else {
                                              Future.delayed(
                                                  const Duration(seconds: 1));
                                              if (!context.mounted) return;
                                              showSnakbar(
                                                  context, "Select valid date");
                                            }
                                          }
                                        },
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              "Fly Back",
                                              style: TextStyle(
                                                fontFamily: "Quicksand",
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              flyBack != null
                                                  ? DateFormat('yyyy-MM-dd')
                                                      .format(flyBack!)
                                                  : "Select Date",
                                              style: const TextStyle(
                                                fontFamily: "Quicksand",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ]),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 20),
                      child: Text("Departure", style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 4),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Theme.of(context).colorScheme.onSecondary),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: TextFormField(
                          controller: _departure,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary,
                            fontSize: 17,
                            fontFamily: "Quicksand",
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            hintText: "City /Airport",
                            hintStyle: TextStyle(fontFamily: "Quicksand"),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 20),
                      child:
                          Text("Destination", style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, bottom: 4),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            controller: _destination,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontSize: 17,
                              fontFamily: "Quicksand",
                              fontWeight: FontWeight.bold,
                            ),
                            decoration: const InputDecoration(
                              hintText: "City /Airport",
                              hintStyle: TextStyle(fontFamily: "Quicksand"),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        )),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 16),
                      child: Text("Adults", style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Theme.of(context).colorScheme.onSecondary),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (_adult > 0) {
                                      _adult -= 1;
                                    }
                                  });
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.circleMinus,
                                  size: 35,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "$_adult",
                                style: const TextStyle(fontSize: 26),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (_adult < 4) {
                                      _adult += 1;
                                    }
                                  });
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.circlePlus,
                                  size: 35,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          ]),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 10, top: 16),
                      child: Text("Children", style: TextStyle(fontSize: 20)),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1,
                              color: Theme.of(context).colorScheme.onSecondary),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100))),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (_children > 0) {
                                      _children -= 1;
                                    }
                                  });
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.circleMinus,
                                  size: 35,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                "$_children",
                                style: const TextStyle(fontSize: 26),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (_children < 4) {
                                      _children += 1;
                                    }
                                  });
                                },
                                icon: const Icon(
                                  FontAwesomeIcons.circlePlus,
                                  size: 35,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                          ]),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) {
                              return const FlightSerchPage();
                            },
                            settings: RouteSettings(
                              arguments: {
                                "dateflyOut": flyOut,
                                "dateflyBack": flyBack,
                                "departure": _departure.text,
                                "destination": _destination.text,
                                "adult": _adult,
                                "children": _children,
                              },
                            ),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(55),
                        backgroundColor: Colors.orange,
                      ),
                      child: const Text(
                        "Search",
                        style: TextStyle(
                          color: Colors.white,
                        ),
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
