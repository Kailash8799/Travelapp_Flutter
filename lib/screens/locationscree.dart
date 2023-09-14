import 'dart:convert';
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
                                  return InkWell(
                                    onTap: () {
                                      Navigator.of(context).pop({
                                        "selectedCountry": countries[index]
                                            ?["name"]["common"],
                                        "countryCode": countries[index]?["fifa"]
                                      });
                                    },
                                    child: SizedBox(
                                      height: 50,
                                      child: Card(
                                        surfaceTintColor: Colors.transparent,
                                        elevation: 0.4,
                                        child: Row(children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            child: Image.network(
                                              countries[index]?["flags"]["png"],
                                              height: 50,
                                              width: 55,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 5),
                                            child: Text(
                                              countries[index]?["name"]
                                                              ["common"]
                                                          ?.length >
                                                      20
                                                  ? (countries[index]["name"]
                                                              ["common"])
                                                          .substring(0, 20) +
                                                      "..."
                                                  : countries[index]?["name"]
                                                      ["common"],
                                              style: const TextStyle(
                                                  color: Colors.red,
                                                  overflow:
                                                      TextOverflow.ellipsis),
                                            ),
                                          ),
                                        ]),
                                      ),
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
