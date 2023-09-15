import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:travel_app/constants/dburl.dart';

class MongoDatabase {
  static Db? db;
  static final DbCollection user = db!.collection(userCollection);
  static final DbCollection allplaces = db!.collection(places);

  static Future<void> connect() async {
    try {
      db = await Db.create(mongoUri);
      await db!.open();
      inspect(db);
      // return true;
    } catch (e) {
      log(e.toString());
      // return false;
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
