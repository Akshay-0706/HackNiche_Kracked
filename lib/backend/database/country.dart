import 'package:intl/intl.dart';

class News {
  final String title;
  final String img;
  final String description;

  News(this.title, this.img, this.description);
}

class Country {
  final List<News> news;

  Country(this.news);

  factory Country.fromJSON(Map<String, dynamic> json) {
    List<News> news = [];
    // print('in');
    List<dynamic> data = json['articles'] as List<dynamic>;
    for (var ele in data) {
      // var index = data.indexOf(ele);
      if (ele['urlToImage'] == null ||
          ele['description'] == null ||
          ele['title'] == null) continue;
      // print(ele['title']);
      // print(ele['urlToImage']);
      // print(ele['description']);
      // print('----------------');
      News s = News(ele['title'], ele['urlToImage'], ele['description']);
      news.add(s);
    }
    return Country(news);
  }
}
