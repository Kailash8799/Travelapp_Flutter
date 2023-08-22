import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Setlocationscreen extends StatefulWidget {
  const Setlocationscreen({super.key});

  @override
  State<Setlocationscreen> createState() => _SetlocationscreenState();
}

class _SetlocationscreenState extends State<Setlocationscreen> {
  bool locationloading = false;
  List<dynamic> countries = [];

  Future<void> getAllCountry() async {
    setState(() {
      locationloading = true;
    });
    try {
      final response =
          await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

      if (response.statusCode == 200) {
        setState(() {
          countries = json.decode(response.body);
        });
      } else {
        setState(() {
          locationloading = false;
        });
        throw Exception('Failed to load country data');
      }
      setState(() {
        locationloading = false;
      });
    } catch (e) {
      setState(() {
        locationloading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllCountry();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        child: Container(
          width: 300,
          height: 500,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Scaffold(
            body: Center(
              child: Container(
                  child: countries.isNotEmpty
                      ? Column(
                          children: [
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 15),
                                    child: Text(
                                      "Select a country",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      icon: const Icon(Icons.close))
                                ]),
                            Expanded(
                              child: ListView.builder(
                                itemCount: countries.length,
                                itemBuilder: (context, index) {
                                  return SizedBox(
                                    height: 40,
                                    child: Card(
                                      child: Row(children: [
                                        Image.network(
                                          countries[index]?["flags"]["png"],
                                          height: 30,
                                          width: 30,
                                        ),
                                        Text(
                                          countries[index]?["name"]["common"]
                                                      ?.length >
                                                  20
                                              ? ""
                                              : countries[index]?["name"]
                                                  ["common"],
                                          style: TextStyle(
                                              color: Colors.red,
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ]),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        )),
            ),
          ),
        ),
      ),
    );
  }
}
