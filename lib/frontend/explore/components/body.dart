import 'package:djhackathon/size.dart';
import 'package:djhackathon/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ExploreBody extends StatelessWidget {
  const ExploreBody({super.key});

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                'Trending Topic',
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
                    width: SizeConfig.width,
                    height: 200,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: buildTopic(
                              'Tesla',
                              '1.2k',
                              'assets/trending_topics/circle1_tesla_1.2k.jpg',
                              60),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: buildTopic(
                              'Tesla',
                              '1.2k',
                              'assets/trending_topics/circle1_tesla_1.2k.jpg',
                              60),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: getWidth(20)),
                  SizedBox(
                    width: SizeConfig.width,
                    height: 200,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 0,
                          left: 0,
                          child: buildTopic(
                              'Tesla',
                              '1.2k',
                              'assets/trending_topics/circle1_tesla_1.2k.jpg',
                              60),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: buildTopic(
                              'Tesla',
                              '1.2k',
                              'assets/trending_topics/circle1_tesla_1.2k.jpg',
                              60),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTopic(String name, String views, String asset, double width) {
    return Stack(
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
              ),
              Text(
                views,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
