import 'dart:math';

import 'package:djhackathon/backend/database/api.dart';
import 'package:djhackathon/backend/database/spotlight.dart';
import 'package:djhackathon/frontend/components/custom_page_route.dart';
import 'package:djhackathon/frontend/country/country.dart';
import 'package:djhackathon/frontend/home_content/components/shimmer.dart';
import 'package:djhackathon/frontend/news/news.dart';
import 'package:djhackathon/frontend/spotlight/spotlight.dart';
import 'package:djhackathon/size.dart';
import 'package:djhackathon/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../components/news_card.dart';

class HomeContentBody extends StatefulWidget {
  const HomeContentBody({super.key});

  @override
  State<HomeContentBody> createState() => _HomeContentBodyState();
}

class _HomeContentBodyState extends State<HomeContentBody> {
  final box = GetStorage();
  bool isReady = false;
  late List<Spots> spots;
  List<String> countries = [
    "India",
    "USA",
    "France",
    "England",
    "Russia",
    "Australia",
  ];

  @override
  void initState() {
    fetchData('all').then((value) {
      setState(() {
        isReady = true;
        spots = value!.spots;
        spots.shuffle();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: pallete.primaryDark(),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Icon(
                          Icons.notifications_rounded,
                          color: pallete.background(),
                          size: getWidth(20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: Text(
                  "Hi, ${box.read("name").toString().split(" ")[0]}!",
                  style: TextStyle(
                    color: pallete.primaryDark(),
                    fontSize: getWidth(18),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: Text(
                  "Explore today's!",
                  style: TextStyle(
                    color: pallete.primaryDark(),
                    fontSize: getWidth(22),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      6,
                      (index) => FlagCard(
                        pallete: pallete,
                        index: index,
                        country: countries[index],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(pi),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(20),
                        ),
                        child: Image.asset(
                          "assets/images/mumbai.png",
                          height: getHeight(120),
                        ),
                      ),
                    ),
                    Container(
                      height: getHeight(100),
                      decoration: BoxDecoration(
                        color: const Color(0xff2d60e3).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(height: getWidth(20)),
                              Text(
                                "Your current location",
                                style: TextStyle(
                                    color: pallete.primaryDark(),
                                    fontSize: getWidth(12)),
                              ),
                              Text(
                                "Mumbai",
                                style: TextStyle(
                                  color: pallete.primaryDark(),
                                  fontSize: getWidth(24),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: getWidth(20)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "SpotLight",
                      style: TextStyle(
                        color: pallete.primaryDark(),
                        fontSize: getWidth(18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "See all",
                      style: TextStyle(
                        color: pallete.primaryDark(),
                        fontSize: getWidth(14),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      6,
                      (index) => isReady
                          ? GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                CustomPageRoute(
                                  context,
                                  SpotLight(
                                      spots: spots[spots.length - index - 1]),
                                ),
                              ),
                              child: SpotlightCard(
                                spot: spots[spots.length - index - 1],
                                pallete: pallete,
                                index: index,
                              ),
                            )
                          : SpotlightShimmer(index: index),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest News",
                      style: TextStyle(
                        color: pallete.primaryDark(),
                        fontSize: getWidth(18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "See all",
                      style: TextStyle(
                        color: pallete.primaryDark(),
                        fontSize: getWidth(14),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              ...List.generate(
                10,
                (index) => isReady
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
                        child: NewsCard(
                          spot: spots[index],
                          pallete: pallete,
                          index: index,
                          length: 10,
                        ),
                      )
                    : NewsItemShimmer(index: index),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: pallete.primaryDark()),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Text(
                            "View more",
                            style: TextStyle(
                              color: pallete.primaryDark(),
                              fontSize: getWidth(14),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: pallete.primaryDark(),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FlagCard extends StatelessWidget {
  const FlagCard({
    Key? key,
    required this.pallete,
    required this.country,
    required this.index,
  }) : super(key: key);

  final Pallete pallete;
  final String country;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (index == 0) SizedBox(width: getWidth(20)),
        Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  CustomPageRoute(
                    context,
                    Country(
                      country: country,
                    ),
                  ),
                );
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  border: Border.all(color: pallete.primary(), width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: SvgPicture.asset(
                    "assets/icons/${country.toLowerCase()}.svg",
                    width: 400,
                    height: 400,
                  ),
                ),
              ),
            ),
            SizedBox(height: getWidth(5)),
            Text(
              country,
              style: TextStyle(
                color: pallete.primaryDark(),
                fontSize: getWidth(16),
              ),
            ),
          ],
        ),
        if (index != 5) SizedBox(width: getWidth(10)),
        if (index == 5) SizedBox(width: getWidth(20)),
      ],
    );
  }
}

class SpotlightCard extends StatelessWidget {
  const SpotlightCard({
    Key? key,
    required this.spot,
    required this.pallete,
    required this.index,
  }) : super(key: key);

  final Spots spot;
  final Pallete pallete;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (index == 0) SizedBox(width: getWidth(20)),
        Container(
          width: getWidth(240),
          height: getWidth(300),
          decoration: BoxDecoration(
            color: pallete.primaryDark().withOpacity(0.7),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            fit: StackFit.expand,
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  spot.img,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.8),
                    ],
                    stops: const [
                      0.0,
                      0.2,
                      0.3,
                      0.4,
                      0.5,
                      0.6,
                    ],
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      spot.title,
                      style: TextStyle(
                        color: pallete.background(),
                        fontSize: getWidth(18),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          spot.author,
                          style: TextStyle(
                            color: pallete.background().withOpacity(0.8),
                            fontSize: getWidth(12),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          spot.time.hour.toString(),
                          style: TextStyle(
                            color: pallete.background().withOpacity(0.8),
                            fontSize: getWidth(12),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        if (index < 5) SizedBox(width: getWidth(20)),
        if (index == 5) SizedBox(width: getWidth(20)),
      ],
    );
  }
}
