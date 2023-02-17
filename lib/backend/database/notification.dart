import 'dart:ffi';

import 'package:intl/intl.dart';

class Notis {
  final String title;
  final String img;
  final DateTime time;

  Notis(this.title, this.img, this.time);
  factory Notis.fromJSON(Map<String, dynamic> json) {
    Map<String, dynamic> data = json['articles'][0];
    String t = data['publishedAt'];
    var temp = t.split('T');
    var x = temp[1].split('Z');
    DateTime time = new DateFormat("hh:mm").parse(x[0]);
    return Notis(data['title'], data['urlToImage'], time);
  }
}

class Notifications {
  final Notis notis;

  Notifications(this.notis);
}
