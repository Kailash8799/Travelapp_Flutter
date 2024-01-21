import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_app/components/bookingall/flightsearchpage.dart';

class Busbookingpage extends StatefulWidget {
  const Busbookingpage({super.key});

  @override
  State<Busbookingpage> createState() => _BusbookingpageState();
}

class _BusbookingpageState extends State<Busbookingpage> {
  final TextEditingController _departure = TextEditingController();
  final TextEditingController _destination = TextEditingController();
  DateTime? busbookdate;

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
                                        busbookdate = dateOut;
                                      });
                                    }
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Bus date",
                                        style: TextStyle(
                                            fontFamily: "Quicksand",
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        busbookdate != null
                                            ? DateFormat('yyyy-MM-dd')
                                                .format(busbookdate!)
                                            : "Select Date",
                                        style: const TextStyle(
                                            fontFamily: "Quicksand"),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
                            hintText: "City",
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
                              hintText: "City",
                              hintStyle: TextStyle(fontFamily: "Quicksand"),
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, CupertinoPageRoute(
                          builder: (context) {
                            return const FlightSerchPage();
                          },
                        ));
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
