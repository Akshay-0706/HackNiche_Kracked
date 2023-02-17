import 'package:carousel_slider/carousel_slider.dart';
import 'package:djhackathon/frontend/explore/components/results.dart';
import 'package:djhackathon/frontend/explore/components/see_all_categories.dart';
import 'package:djhackathon/size.dart';
import 'package:djhackathon/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreBody extends StatelessWidget {
  const ExploreBody({super.key});

  static const texts = [
    'Business',
    'Sports',
    'Health',
    'Technology',
  ];

  static const images = [
    'assets/categories/business.png',
    'assets/categories/sports.png',
    'assets/categories/health.png',
    'assets/categories/technology.png',
  ];

  static const colors = [
    Color(0xfff1b67d),
    Color(0xff8dbec4),
    Color(0xfff17d7d),
    Color(0xff7df1b9)
  ];

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 22,
                // vertical: 15,
              ),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  // fillColor: pallete.background(),
                  fillColor: const Color(0xfff7f6f9),
                  filled: true,
                  hintText: 'Topic, Media or Journalist',

                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(right: 14.0, left: 7),
                    child: SvgPicture.asset(
                      'assets/icons/search.svg',
                      width: 30,
                    ),
                  ),
                  prefixIconConstraints: const BoxConstraints(
                    maxHeight: 45,
                    maxWidth: 45,
                  ),
                ),
                onSubmitted: (value) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Results(
                        query: value,
                      ),
                    ),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Trending Topics',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff0d253c)),
              ),
            ),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // This widget will be repeated
                  SizedBox(
                    width: SizeConfig.width * 1.55,
                    height: 250,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 30,
                          left: 16,
                          child: buildTopic(
                              'Tesla',
                              '1.2k',
                              'assets/trending_topics/circle1_tesla_1.2k.jpg',
                              60,
                              context),
                        ),
                        Positioned(
                          left: 46,
                          top: 100,
                          child: buildTopic(
                              'Reliance',
                              '3.0k',
                              'assets/trending_topics/circle2_reliance_3.0k.jpg',
                              100,
                              context),
                        ),
                        Positioned(
                          top: 0,
                          left: 135,
                          child: buildTopic(
                              'Narendra Modi',
                              '9.5k',
                              'assets/trending_topics/circle3_Narendra_Modi_9.5k.jpg',
                              125,
                              context),
                        ),
                        Positioned(
                          top: 140,
                          left: 200,
                          child: buildTopic(
                              'Turkey',
                              '2.2k',
                              'assets/trending_topics/circle4_turkey_2.2k.png',
                              60,
                              context),
                        ),
                        Positioned(
                          top: 90,
                          left: 280,
                          child: buildTopic(
                              'Elon Musk',
                              '9.2k',
                              'assets/trending_topics/circle5_Elon_musk_9.2k.jpg',
                              125,
                              context),
                        ),
                        Positioned(
                          top: 0,
                          left: 320,
                          child: buildTopic(
                              'Shaadi',
                              '2.5k',
                              'assets/trending_topics/circle6_Shaadi_2.5k.jpg',
                              80,
                              context),
                        ),
                        Positioned(
                          top: 5,
                          left: 420,
                          child: buildTopic(
                              'Space',
                              '2.5k',
                              'assets/trending_topics/circle7_Space_2.5k.jpeg',
                              110,
                              context),
                        ),
                        Positioned(
                          top: 135,
                          left: 470,
                          child: buildTopic(
                              'Virat Kohli',
                              '1.5k',
                              'assets/trending_topics/circle8_Virat_Kohli_1.5k.jpeg',
                              80,
                              context),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.width * 1.55,
                    height: 250,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 30,
                          left: 16,
                          child: buildTopic(
                              'Budget India',
                              '3.5k',
                              'assets/trending_topics/circle9_Budget_India_3.5k.jpeg',
                              60,
                              context),
                        ),
                        Positioned(
                          left: 46,
                          top: 100,
                          child: buildTopic(
                              'Nasdaq',
                              '5.5k',
                              'assets/trending_topics/circle10_Nasdaq_5.5k.jpeg',
                              100,
                              context),
                        ),
                        Positioned(
                          top: 0,
                          left: 135,
                          child: buildTopic(
                              'Ukraine',
                              '2.3k',
                              'assets/trending_topics/circle11_Ukraine_2.3k.jpeg',
                              125,
                              context),
                        ),
                        Positioned(
                          top: 140,
                          left: 200,
                          child: buildTopic(
                              'Politics',
                              '1.3k',
                              'assets/trending_topics/circle12_Politics_1.3k.jpeg',
                              60,
                              context),
                        ),
                        Positioned(
                          top: 90,
                          left: 280,
                          child: buildTopic(
                              'China',
                              '4.3k',
                              'assets/trending_topics/circle13_China_4.3k.jpeg',
                              125,
                              context),
                        ),
                        Positioned(
                          top: 0,
                          left: 320,
                          child: buildTopic(
                              'IPL',
                              '2.3k',
                              'assets/trending_topics/circle14_IPL_2.3k.jpeg',
                              80,
                              context),
                        ),
                        Positioned(
                          top: 5,
                          left: 420,
                          child: buildTopic(
                              'Olympics',
                              '4.6k',
                              'assets/trending_topics/circle15_Olympics_4.6k.jpeg',
                              110,
                              context),
                        ),
                        Positioned(
                          top: 135,
                          left: 470,
                          child: buildTopic(
                              'Tech',
                              '3.9k',
                              'assets/trending_topics/circle16_Tech_3.9k.jpeg',
                              80,
                              context),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.width * 1.55,
                    height: 250,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 30,
                          left: 16,
                          child: buildTopic(
                              '5G',
                              '1.9k',
                              'assets/trending_topics/circle17_5g_1.9k.jpeg',
                              60,
                              context),
                        ),
                        Positioned(
                          left: 46,
                          top: 100,
                          child: buildTopic(
                              'Nvidia',
                              '4.9k',
                              'assets/trending_topics/circle18_Nvidia_4.9k.jpeg',
                              100,
                              context),
                        ),
                        Positioned(
                          top: 0,
                          left: 135,
                          child: buildTopic(
                              'World News',
                              '5.9k',
                              'assets/trending_topics/circle19_World News_5.9k.jpeg',
                              125,
                              context),
                        ),
                        Positioned(
                          top: 140,
                          left: 200,
                          child: buildTopic(
                              'Movies',
                              '1.8k',
                              'assets/trending_topics/circle20_Movies_1.8k.jpeg',
                              60,
                              context),
                        ),
                        Positioned(
                          top: 90,
                          left: 280,
                          child: buildTopic(
                              'Hyundai',
                              '5.8k',
                              'assets/trending_topics/circle21_Hyundai_5.8k.jpeg',
                              125,
                              context),
                        ),
                        Positioned(
                          top: 0,
                          left: 320,
                          child: buildTopic(
                              'Gold',
                              '2.8k',
                              'assets/trending_topics/circle22_Gold_2.8k.jpeg',
                              80,
                              context),
                        ),
                        Positioned(
                          top: 5,
                          left: 420,
                          child: buildTopic(
                              'RBI',
                              '3.8k',
                              'assets/trending_topics/circle23_RBI_3.8k.jpeg',
                              110,
                              context),
                        ),
                        Positioned(
                          top: 135,
                          left: 470,
                          child: buildTopic(
                              'UN',
                              '2.8k',
                              'assets/trending_topics/circle24_UN_2.8k.jpeg',
                              80,
                              context),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text(
                    'Explore By Category',
                    style: TextStyle(
                        fontSize: getWidth(18),
                        fontWeight: FontWeight.bold,
                        color: pallete.primaryDark()),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AllCategories(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'See All',
                      style: TextStyle(
                          fontSize: getWidth(14),
                          fontWeight: FontWeight.bold,
                          color: pallete.primaryDark()),
                    ),
                  ),
                ),
              ],
            ),
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 0.8,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
              ),
              items: [0, 1, 2, 3].map((i) {
                return Builder(
                  builder: (BuildContext context) {
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
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 10.0),
                          padding: EdgeInsets.all(15.0),
                          alignment: Alignment.bottomLeft,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(images[i]),
                                fit: BoxFit.cover),
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
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTopic(String name, String views, String asset, double width,
      BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Results(
              query: name,
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            width: width,
            height: width,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(asset),
                fit: BoxFit.cover,
              ),
              shape: BoxShape.circle,

              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.grey.withOpacity(0.5),
              //     spreadRadius: 5,
              //     blurRadius: 7,
              //     offset: Offset(0, 3), // changes position of shadow
              //   ),
              // ],
            ),
          ),
          Container(
            height: width,
            width: width,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0),
                  Colors.black.withOpacity(0.6),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // Container(
                //   height: 100,
                //   width: 100,
                //   decoration: BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage(asset),
                //       fit: BoxFit.cover,
                //     ),
                //     borderRadius: BorderRadius.circular(20),
                //   ),
                // ),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  views + ' views',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 5),
              ],
            ),
          )
        ],
      ),
    );
  }
}
