import 'package:flutter/material.dart';

class ExploreCategories extends StatelessWidget {
  const ExploreCategories({super.key});

  static const List<String> categories = [
    'assets/categories/business.png',
    'assets/categories/entertainment.png',
    'assets/categories/health.png',
    'assets/categories/science.png',
    'assets/categories/sports.png',
    'assets/categories/technology.png',
    'assets/categories/world_news.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 20),
        height: 100,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                      ),
                    ],
                  ),
                  child: Image.asset(
                    categories[index],
                    height: 50,
                    width: 50,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Business',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
