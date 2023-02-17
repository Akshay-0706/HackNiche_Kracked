import 'dart:convert';
import 'package:djhackathon/backend/database/spotlight.dart';
import 'package:djhackathon/backend/database/notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<Spotlight?> fetchData(String cat) async {
  // print('hello');
  String url = "https://inshorts.deta.dev/news?category=$cat";
  // print(url);
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // print('out');
    return Spotlight.fromJSON(jsonDecode(response.body));
  } else {
    return null;
  }
}

Future<Object?> fetchDataNoti() async {
  // print('hello');
  String url = "https://newsapi.org/v2/everything?q=india&from=2023-01-17&sortBy=publishedAt&apiKey=c939257a6df04d6e8dbfb99ee1aa0842";
  // print(url);
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // print('out');
    return Notis.fromJSON(jsonDecode(response.body));
  } else {
    return null;
  }
}
