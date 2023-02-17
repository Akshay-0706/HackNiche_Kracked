import 'package:djhackathon/size.dart';
import 'package:djhackathon/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'results.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  static const texts = [
    'Business',
    'Sports',
    'Health',
    'Technology',
    'Entertainment',
    'Science',
    'World News'
  ];

  static const images = [
    'assets/categories/business.png',
    'assets/categories/sports.png',
    'assets/categories/health.png',
    'assets/categories/technology.png',
    'assets/categories/entertainment.png',
    'assets/categories/science.png',
    'assets/categories/world_news.png'
  ];

  static const colors = [
    Color(0xfff1b67d),
    Color(0xff8dbec4),
    Color(0xfff17d7d),
    Color(0xff7df1b9),
    Color(0xfff1e57d),
    Color(0xff947df1),
    Color(0xff94f17d)
  ];

  @override
  Widget build(BuildContext context) {
    final pallete = Pallete(context);

    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 7, left: 12),
            child: Text(
              'Explore By Category',
              style: TextStyle(
                color: pallete.primaryDark(),
                fontSize: getWidth(18),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: texts.length,
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Results(
                          category: texts[i],
                        ),
                      ),
                    );
                  },
                  child: Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      margin:
                          EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
                      padding: EdgeInsets.all(15.0),
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(images[i]), fit: BoxFit.cover),
                        color: colors[i],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        texts[i],
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      )),
                );
              })
        ]),
      ),
    );
  }
}
