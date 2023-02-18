import 'dart:convert';
import 'package:djhackathon/backend/database/country.dart';
import 'package:djhackathon/backend/database/spotlight.dart';
import 'package:djhackathon/backend/database/notification.dart';
import 'package:djhackathon/const.dart';
import 'package:http/http.dart' as http;

import 'news_data.dart';

Future<Spotlight?> fetchData(String cat) async {
  // print('hello');
  // String url = "https://inshorts.deta.dev/news?category=$cat";
  String url = "${Global.host}/cat/$cat";
  // print(url);
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // print('out');
    return Spotlight.fromJSON(cat, jsonDecode(response.body));
  } else {
    return null;
  }
}

Future<Object?> fetchDataNoti() async {
  // print('hello');
  // String url =
  //     "https://newsapi.org/v2/everything?q=india&from=2023-01-17&sortBy=publishedAt&apiKey=c939257a6df04d6e8dbfb99ee1aa0842";
  String url = "${Global.host}/noti";
  // print(url);
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // print('out');
    return Notis.fromJSON(jsonDecode(response.body));
  } else {
    return null;
  }
}

Future<Country?> fetchDataCountry(String country) async {
  // print('hello');
  // String url =
  //     "https://saurav.tech/NewsAPI/top-headlines/category/general/$country.json";
  String url = "${Global.host}/country/$country";
  // print(url);
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // print('out');
    return Country.fromJSON(jsonDecode(response.body));
  } else {
    return null;
  }
}

Future<NewsData?> fetchNewsData(String? query, String? category) async {
  // late String url;

  // if (category != null && query != null) {
  //   url =
  //       "https://newsapi.org/v2/top-headlines?q=$query&category=$category&sortBy=publishedAt&apiKey=f91f9ae4b85f41ff954bb7080170b604";
  // } else if (category != null) {
  //   url =
  //       "https://newsapi.org/v2/top-headlines?category=$category&sortBy=publishedAt&apiKey=f91f9ae4b85f41ff954bb7080170b604";
  // } else {
  //   url =
  //       "https://newsapi.org/v2/top-headlines?q=$query&sortBy=publishedAt&apiKey=f91f9ae4b85f41ff954bb7080170b604";
  // }

  // print(url);

  String url = "${Global.host}/news/$query/$category";

  final response = await http.get(Uri.parse(url));
  print(response.statusCode);

  if (response.statusCode == 200) {
    // print('out');
    return NewsData.fromJson(jsonDecode(response.body));
  } else {
    return null;
  }
}

Future<List<Spots>> fetchDataAll() async {
  // print('hello');
  List<Spots> all = [];
  List<String> cat = [
    'business',
    'sports',
    'politics',
    'technology',
    'startup',
    'entertainment',
    'science',
    'automobile'
  ];

  for (var c in cat) {
    String url = "https://inshorts.deta.dev/news?category=$c";
    // print(url);
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // print('out');
      List<Spots> s = Spotlight.fromJSON(c, jsonDecode(response.body)).spots;
      // print(s.length);
      all.add(s[0]);
      all.add(s[1]);
    }
  }
  return all;
}

Future<Spotlight?> fetchDataForYou() async {
  // print('hello');
  String url = "https://inshorts.deta.dev/news?category=all";
  // print(url);
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    // print('out');
    return Spotlight.fromJSON("", jsonDecode(response.body));
  } else {
    return null;
  }
}
