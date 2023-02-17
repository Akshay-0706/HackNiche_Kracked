import 'package:djhackathon/backend/database/api.dart';
import 'package:djhackathon/backend/database/spotlight.dart';
import 'package:djhackathon/frontend/components/news_card.dart';
import 'package:djhackathon/frontend/home_content/components/shimmer.dart';
import 'package:djhackathon/size.dart';
import 'package:djhackathon/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Results extends StatefulWidget {
  const Results({super.key, this.category, this.query});

  final String? category;
  final String? query;

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  bool isReady = false;
  List<Spots> spots = [];
  int? results;

  @override
  void initState() {
    fetchNewsData(widget.query, widget.category).then((value) {
      setState(() {
        isReady = true;
        results = value!.totalResults;
        print('here');

        value.articles!.forEach((element) {
          print('a1');
          spots.add(Spots(
              element.title!,
              element.urlToImage ??
                  'https://static.vecteezy.com/packs/media/vectors/term-bg-1-3d6355ab.jpg',
              element.author ?? 'Unknown',
              DateTime.parse(element.publishedAt!)));
        });
        print('a2');
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pallete = Pallete(context);
    return SafeArea(
        child: Scaffold(
      body: ListView(
        children: !isReady
            ? [
                SizedBox(
                  height: getHeight(300),
                ),
                const Center(
                  child: CircularProgressIndicator(),
                )
              ]
            : [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Text(
                    'Search Results ($results) ',
                    style: TextStyle(
                      color: pallete.primaryDark(),
                      fontSize: getWidth(18),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ...List.generate(
                  results ?? 10,
                  (index) => isReady
                      ? NewsCard(
                          spot: spots[index],
                          pallete: pallete,
                          index: index,
                          length: results!,
                        )
                      : NewsItemShimmer(index: index),
                ),
              ],
      ),
    ));
  }
}
