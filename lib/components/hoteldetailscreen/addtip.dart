import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:travel_app/components/widget/snakbar.dart';
import 'package:travel_app/realm/realm_services.dart';
import 'package:travel_app/realm/schemas.dart';
import 'package:travel_app/screens/homescreen.dart';

class AddTipCardScreen extends StatefulWidget {
  const AddTipCardScreen(
      {super.key,
      required ObjectId id,
      required AllReservations allReservations})
      : _resid = id,
        _allReservations = allReservations;
  final ObjectId _resid;
  final AllReservations _allReservations;
  @override
  State<AddTipCardScreen> createState() => _AddTipCardScreenState();
}

class _AddTipCardScreenState extends State<AddTipCardScreen> {
  File? image;
  final TextEditingController _tripname = TextEditingController();
  final TextEditingController _destination = TextEditingController();
  DateTime? flyOut;
  DateTime? flyBack;

  final _formKey = GlobalKey<FormState>();
  pickImage() async {
    try {
      if (await Permission.photos.isGranted) {
        final imagex =
            await ImagePicker().pickImage(source: ImageSource.gallery);
        if (imagex != null) {
          image = File(imagex.path);
          setState(() {});
        }
      } else {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Give photos permission to app")));
      }
    } catch (e) {
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    var realmServices = Provider.of<RealmServices>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Tip Card"),
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: InkWell(
                  onTap: pickImage,
                  child: image == null
                      ? Container(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          color: Colors.orange,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                size: 50,
                                color: Colors.white,
                              ),
                              Text(
                                "Add cover photo",
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        )
                      : SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: 150,
                          child: Image.file(
                            File(
                              image!.path,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: _formKey,
                child: Container(
                  padding:
                      const EdgeInsetsDirectional.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                        ),
                        child: Text("Trip name"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: TextFormField(
                          controller: _tripname,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Enter trip name";
                            } else if (value.length < 3) {
                              return "Enter minimun 2 character trip name";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 16),
                            hintText: "trip name",
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
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
                        padding: EdgeInsets.only(
                            left: 15, right: 15, top: 15, bottom: 5),
                        child: Text("Destination"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0),
                        child: TextFormField(
                          controller: _destination,
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 3) {
                              return "Enter a destination";
                            } else {
                              return null;
                            }
                          },
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 16),
                            hintText: "destination name",
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100)),
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
                        padding: EdgeInsets.only(left: 10, top: 12),
                        child: Text(
                          "Date",
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color:
                                    Theme.of(context).colorScheme.onSecondary),
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
                                        firstDate:
                                            DateTime(DateTime.now().year),
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
                                          "From date",
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
                              Expanded(
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
                                      DateTime? dateBack = await showDatePicker(
                                          context: context,
                                          initialDate:
                                              DateTime(DateTime.now().year),
                                          firstDate:
                                              DateTime(DateTime.now().year),
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
                                          "To date",
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
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate() &&
                                flyBack != null &&
                                flyOut != null) {
                              var data = await realmServices.updatebookHotel(
                                  reservations: widget._allReservations,
                                  tripname: _tripname.text,
                                  destinationname: _destination.text,
                                  startdate: flyOut as DateTime,
                                  enddate: flyBack as DateTime,
                                  image:
                                      "https://res.cloudinary.com/dyyonlqge/image/upload/v1684819081/leektginbblyarenktoi.webp");
                              if (data["success"] == false) {
                                if (!context.mounted) return;
                                showSnakbar(
                                    context, "Please try again or skip it");
                                return;
                              } else {
                                if (!context.mounted) return;
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                  builder: (context) {
                                    return const HomeScreen();
                                  },
                                ), (route) => false);
                              }
                            } else {
                              showSnakbar(context, "Please fill all fields");
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                              backgroundColor: Colors.orange),
                          child: const Text(
                            "Add tip",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 19,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                              builder: (context) {
                                return const HomeScreen();
                              },
                            ), (route) => false);
                          },
                          style: ElevatedButton.styleFrom(
                              minimumSize: const Size.fromHeight(50),
                              backgroundColor: Colors.orange),
                          child: const Text(
                            "Skip",
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
              ),
            )
          ],
        ),
      )),
    );
  }
}
