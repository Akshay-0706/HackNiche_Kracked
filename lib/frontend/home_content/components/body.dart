import 'dart:math';

import 'package:djhackathon/size.dart';
import 'package:djhackathon/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../components/news_card.dart';

class HomeContentBody extends StatefulWidget {
  const HomeContentBody({super.key});

  @override
  State<HomeContentBody> createState() => _HomeContentBodyState();
}

class _HomeContentBodyState extends State<HomeContentBody> {
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(getWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Icon(Icons.notifications_rounded),
                  ],
                ),
                const SizedBox(height: 40),
                Text(
                  "Hi, ${box.read("name").toString().split(" ")[0]}!",
                  style: TextStyle(
                    color: pallete.primaryDark(),
                    fontSize: getWidth(18),
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Explore today's!",
                  style: TextStyle(
                    color: pallete.primaryDark(),
                    fontSize: getWidth(22),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Stack(
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
                const SizedBox(height: 20),
                Row(
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
                const SizedBox(height: 10),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...List.generate(
                        4,
                        (index) => SpotlightCard(
                          pallete: pallete,
                          index: index,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
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
                const SizedBox(height: 10),
                ...List.generate(
                  10,
                  (index) => NewsCard(
                    pallete: pallete,
                    index: index,
                    length: 10,
                  ),
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
      ),
    );
  }
}

class SpotlightCard extends StatelessWidget {
  const SpotlightCard({
    Key? key,
    required this.pallete,
    required this.index,
  }) : super(key: key);

  final Pallete pallete;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/mumbai.png'),
                    fit: BoxFit.cover,
                    colorFilter:
                        ColorFilter.mode(Colors.black54, BlendMode.darken),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      "Social Security is Rethinking How it Runs Customer Service After Covid",
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
                          "Mary Warton",
                          style: TextStyle(
                            color: pallete.background().withOpacity(0.8),
                            fontSize: getWidth(12),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "4h ago",
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
        if (index < 3) SizedBox(width: getWidth(20)),
      ],
    );
  }
}
