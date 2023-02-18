import 'package:intl/intl.dart';

class Spots {
  final String title;
  final String desc;
  final String img;
  final String author;
  final String cat;
  final DateTime time;
  final String id;

  Spots(this.title, this.img, this.author, this.time, this.id, this.desc,
      this.cat);
}

class Spotlight {
  final List<Spots> spots;

  Spotlight(this.spots);

  factory Spotlight.fromJSON(String cat, Map<String, dynamic> json) {
    List<Spots> spots = [];
    // print('in');
    List<dynamic> data = json['data'] as List<dynamic>;
    for (var ele in data) {
      String dateTime =
          ele["date"] + " " + ele['time'].toString().toUpperCase();

      DateTime time = DateFormat("d MMM y,EEEE hh:mm a").parse(dateTime);
      // print(time);
      Spots s = Spots(ele['title'], ele['imageUrl'], ele['author'], time,
          ele['title'], ele['content'], cat);
      spots.add(s);
    }
    return Spotlight(spots);
  }
}
