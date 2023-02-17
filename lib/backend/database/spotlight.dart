import 'package:intl/intl.dart';

class Spots {
  final String title;
  final String img;
  final String author;
  final DateTime time;

  Spots(this.title, this.img, this.author, this.time);
}

class Spotlight {
  final List<Spots> spots;

  Spotlight(this.spots);

  factory Spotlight.fromJSON(Map<String, dynamic> json) {
    List<Spots> spots = [];
    // print('in');
    List<dynamic> data = json['data'] as List<dynamic>;
    for (var ele in data) {
      // print('function');
      // print(ele['title']);
      String t = ele['time'];

      // print('in2');
      DateTime time = new DateFormat("hh:mm").parse(t);
      // print(time);
      Spots s = Spots(ele['title'], ele['imageUrl'], ele['author'], time);
      spots.add(s);
    }
    return Spotlight(spots);
  }
}
