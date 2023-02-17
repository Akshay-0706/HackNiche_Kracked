import 'dart:convert';
import 'package:djhackathon/backend/database/spotlight.dart';
import 'package:http/http.dart' as http;

Future<Spotlight?> fetchData(String cat) async {
  print('hello');
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
