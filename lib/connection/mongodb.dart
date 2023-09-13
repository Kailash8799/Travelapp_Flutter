import 'dart:developer';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:travel_app/constants/dburl.dart';

class MongoDatabase {
  static Db? db;
  static final DbCollection user = db!.collection(userCollection);

  static connect() async {
    db = await Db.create(mongoUri);
    await db!.open();
    inspect(db);
  }

  static close() async {
    await db!.close();
  }
}
