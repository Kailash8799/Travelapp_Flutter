import 'dart:developer';
import 'package:flutter/widgets.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:travel_app/constants/dburl.dart';

class MongoDatabase with ChangeNotifier {
  static Db? db;
  static final DbCollection user = db!.collection(userCollection);
  static final DbCollection allplaces = db!.collection(places);
  static final DbCollection allHotels = db!.collection(hotelCollection);

  static Future<void> connect() async {
    try {
      db = await Db.create(mongoUri);
      await db!.open();
      inspect(db);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> close() async {
    try {
      await db!.close();
    } catch (e) {
      log(e.toString());
    }
  }
}


// public key
//pybgjvjs

// private

//34942a25-7e26-4856-892f-79db84748dae
