import 'package:travel_app/realm/schemas.dart';
import 'package:realm/realm.dart';
import 'package:flutter/material.dart';

class RealmServices with ChangeNotifier {
  static const String queryAllName = "getAllItemsSubscription";
  static const String queryMyItemsName = "getMyItemsSubscription";

  bool offlineModeOn = false;
  bool isWaiting = false;
  late Realm realm;
  User? currentUser;
  App app;

  RealmServices(this.app) {
    if (app.currentUser != null || currentUser != app.currentUser) {
      currentUser ??= app.currentUser;
      realm = Realm(Configuration.flexibleSync(currentUser!, [
        Userdata.schema,
        Place.schema,
        Listing.schema,
        ListingFacilities.schema,
        PlaceFacilities.schema
      ]));
      if (realm.subscriptions.isEmpty) {
        updateSubscriptions();
        notifyListeners();
      }
    }
  }

  Future<void> updateSubscriptions() async {
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.clear();
      mutableSubscriptions.add(realm.all<Userdata>());
      mutableSubscriptions.add(realm.all<Place>());
      mutableSubscriptions.add(realm.all<Listing>());
    });
    await realm.subscriptions.waitForSynchronization();
    notifyListeners();
  }

  Future<void> sessionSwitch() async {
    offlineModeOn = !offlineModeOn;
    if (offlineModeOn) {
      realm.syncSession.pause();
    } else {
      try {
        isWaiting = true;
        notifyListeners();
        realm.syncSession.resume();
        await updateSubscriptions();
      } finally {
        isWaiting = false;
      }
    }
    notifyListeners();
  }

  Future<void> switchSubscription(bool value) async {
    if (!offlineModeOn) {
      try {
        isWaiting = true;
        notifyListeners();
        await updateSubscriptions();
      } finally {
        isWaiting = false;
      }
    }
    notifyListeners();
  }

  // void createItem(String summary, bool isComplete) {
  //   final newItem =
  //       Item(ObjectId(), summary, currentUser!.id, isComplete: isComplete);
  //   realm.write<Item>(() => realm.add<Item>(newItem));
  //   notifyListeners();
  // }

  void createUser(
      String email, String password, String name, String ownerId) async {
    try {
      final newItem = Userdata(
        ObjectId(),
        ownerId,
        email,
        password,
        name: name,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        emailVerified: false,
      );
      realm.write<Userdata>(() => realm.add<Userdata>(newItem));
    } catch (e) {
      print(e);
    } finally {
      notifyListeners();
    }
  }

  // void deleteItem(Item item) {
  //   realm.write(() => realm.delete(item));
  //   notifyListeners();
  // }

  // Future<void> updateItem(Item item,
  //     {String? summary, bool? isComplete}) async {
  //   realm.write(() {
  //     if (summary != null) {
  //       item.summary = summary;
  //     }
  //     if (isComplete != null) {
  //       item.isComplete = isComplete;
  //     }
  //   });
  //   notifyListeners();
  // }

  Future<void> close() async {
    if (currentUser != null) {
      currentUser = null;
    }
    realm.close();
  }
}
