import 'package:intl/intl.dart';

class Spots {
  final String? category;
  final String title;
  final String img;
  final String author;
  final DateTime time;

  Spots(this.category, this.title, this.img, this.author, this.time);
}

class Spotlight {
  final List<Spots> spots;

  Spotlight(this.spots);

  factory Spotlight.fromJSON(Map<String, dynamic> json, String? category) {
    List<Spots> spots = [];
    // print('in');
    List<dynamic> data = json['data'] as List<dynamic>;
    for (var ele in data) {
      String dateTime =
          ele["date"] + " " + ele['time'].toString().toUpperCase();

      DateTime time = DateFormat("d MMM y,EEEE hh:mm a").parse(dateTime);
      // print(time);
      Spots s = Spots(category, ele['title'], ele['imageUrl'], ele['author'], time);
      spots.add(s);
    }
    return Spotlight(spots);
  }
}
