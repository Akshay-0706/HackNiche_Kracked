import 'dart:math';

import 'package:firebase_database/firebase_database.dart';
import 'package:get_storage/get_storage.dart';

class Database {
  static Future getAccount(FirebaseDatabase databaseRef, String email) async {
    email = email.replaceAll(".", "_");
    var data;
    await databaseRef.ref().child("Users/$email").get().then(
      (snapshot) {
        if (snapshot.exists) {
          Map user = snapshot.value as Map;
          data = user;
          return data;
        }

      },
    ).catchError((error) {
      throw error;
    });
    return data;
  }

  static Future getCommunity(FirebaseDatabase databaseRef) async {
    var data;
    DataSnapshot dataSnapshot;
    await databaseRef.ref().child("Community").get().then(
      (snapshot) {
        if (snapshot.exists) {
          Map user = snapshot.value as Map;
          data = user;
          return data;
        }
      },
    ).catchError((error) {
      throw error;
    });
    return data;
  }

  static Future getDrives(FirebaseDatabase databaseRef) async {
    var data;
    DataSnapshot dataSnapshot;
    await databaseRef.ref().child("Drives").get().then(
      (snapshot) {
        if (snapshot.exists) {
          print(snapshot.value);
          Map user = snapshot.value as Map;
          data = user;
          return data;
        }
      },
    ).catchError((error) {
      print(error);
      throw error;
    });
    return data;
  }

  static void setAccount(FirebaseDatabase databaseRef, String email, String name,
      String img) async {
    final db = databaseRef.ref('Users').child(email.replaceAll(".", "_"));

    Map data = {"name": name, "img": img, "level": 0, "progress": 0};

    await db.set(data);
  }

  static void createPost(FirebaseDatabase databaseRef, String img, String title,
      String userImg, String name, String desc) async {
    final db = databaseRef
        .ref('Community')
        .child('/P${Random().nextInt(1000).toString()}');
    Map data = {
      "title": title,
      "desc": desc,
      "img": img,
      "userImg": userImg,
      "likes": 0,
      "name": name,
      "timestamp": DateTime.now().toString(),
      "user": GetStorage().read("email"),
    };

    await db.set(data);
  }

  static void setChallenge(
      FirebaseDatabase databaseRef, String email, int c, int set) {
    email = email.replaceAll(".", "_");
    final db = databaseRef.ref('Users/$email').child('DailyChallenges/C$c');

    Map data = {"isDone": set};

    // db.update(data);
    db.set(data);
  }
}
