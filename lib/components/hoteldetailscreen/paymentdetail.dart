import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
import 'package:travel_app/components/hoteldetailscreen/addtip.dart';
import 'package:travel_app/components/widget/snakbar.dart';
import 'package:travel_app/homesubscreen/booking.dart';
import 'package:travel_app/models/listing.dart';
import 'package:travel_app/realm/app_services.dart';
import 'package:travel_app/realm/realm_services.dart';
import 'package:travel_app/realm/schemas.dart';

class Hotelpaymentdetails extends StatefulWidget {
  const Hotelpaymentdetails({
    super.key,
    required data,
    required email,
    required name,
    required checkmark,
    required daterange,
  })  : _data = data,
        _email = email,
        _name = name,
        _useemailcheckmark = checkmark,
        _bookingrange = daterange;
  final Listingmodel _data;
  final String _name;
  final String _email;
  final bool _useemailcheckmark;
  final DateTimeRange _bookingrange;

  @override
  State<Hotelpaymentdetails> createState() => _HotelpaymentdetailsState();
}

class _HotelpaymentdetailsState extends State<Hotelpaymentdetails> {
  final TextEditingController _cardholdername = TextEditingController();
  final TextEditingController _cardnumber = TextEditingController();
  final TextEditingController _expirydate = TextEditingController();
  final TextEditingController _cvv = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  bool checkbox = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _cardholdername.dispose();
    _cardnumber.dispose();
    _expirydate.dispose();
    _cvv.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Payment Details"),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
            child: Form(
          key: _formkey,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Text("Cardholder Name"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextFormField(
                  controller: _cardholdername,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter cardholder name";
                    } else if (value.length < 3) {
                      return "Enter minimun 3 character name";
                    } else {
                      return null;
                    }
                  },
                  decoration: const InputDecoration(
                    counterText: "",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    hintText: "Cardholder Name",
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
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  top: 15,
                ),
                child: Text("Card Number"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _cardnumber,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter card number";
                    } else if (value.length < 12) {
                      return "Enter 12 digit card number";
                    } else {
                      return null;
                    }
                  },
                  maxLength: 12,
                  decoration: const InputDecoration(
                    counterText: "",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    hintText: "**** **** **** ****",
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
                padding: EdgeInsets.only(
                  left: 15,
                  right: 0,
                  top: 15,
                ),
                child: Text("Card Expiry Date"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _expirydate,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter expiry date";
                    } else if (value.length < 3) {
                      return "Enter valid expiry date";
                    } else {
                      return null;
                    }
                  },
                  maxLength: 4,
                  decoration: const InputDecoration(
                    counterText: "",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    hintText: "MM/YY",
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
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 0,
                  top: 15,
                ),
                child: Text("CVV"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: _cvv,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter CVV";
                    } else if (value.length < 2) {
                      return "Enter 3 digit CVV";
                    } else {
                      return null;
                    }
                  },
                  maxLength: 3,
                  decoration: const InputDecoration(
                    counterText: "",
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                    hintText: "CVV",
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
                    child: Text("Remember Card Details"),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
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
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Total"),
                    Text("\$${widget._data.price}"),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ElevatedButton(
                  onPressed: () async {
                    if (_formkey.currentState!.validate()) {
                      var data = await context.read<RealmServices>().bookHotel(
                            widget._data.id,
                            ObjectId.fromHexString(
                                context.read<RealmServices>().currentUser!.id),
                            widget._data.price *
                                (widget._bookingrange.end
                                    .difference(widget._bookingrange.start)
                                    .inDays),
                            widget._bookingrange.start,
                            widget._bookingrange.end,
                            widget._data.placename,
                            widget._data.imageSrc.first,
                            widget._bookingrange.end,
                            widget._data.title,
                            widget._bookingrange.start,
                            widget._name,
                            widget._email,
                          );
                      if (data["success"] == false) {
                        if (!context.mounted) return;
                        showSnakbar(context, data["message"]);
                        return;
                      }
                      if (!context.mounted) return;
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return AddTipCardScreen(
                          id: data["id"] as ObjectId,
                          allReservations: data["newreservation"],
                        );
                      }));
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size.fromHeight(50),
                      backgroundColor: Colors.orange),
                  child: const Text(
                    "Pay",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
            ]),
          ),
        )),
      ),
    );
  }
}
