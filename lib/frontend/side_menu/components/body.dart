import 'package:cached_network_image/cached_network_image.dart';
import 'package:djhackathon/backend/database/api.dart';
import 'package:djhackathon/backend/database/notification.dart';
import 'package:djhackathon/backend/database/spotlight.dart';
import 'package:djhackathon/backend/functions/fun.dart';
import 'package:djhackathon/const.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/parser.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../../backend/auth/user_account.dart';
import '../../../size.dart';
import '../../../theme.dart';
import '../../components/custom_page_route.dart';
import '../../welcome/welcome.dart';

class SideMenuBody extends StatefulWidget {
  const SideMenuBody({super.key});

  @override
  State<SideMenuBody> createState() => _SideMenuBodyState();
}

class _SideMenuBodyState extends State<SideMenuBody> {
  bool isReady = false;
  late int current;
  final box = GetStorage();
  @override
  void initState() {
    current = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return Scaffold(
      backgroundColor: pallete.primaryDark(),
      body: SizedBox(
        width: SizeConfig.width * 0.79,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getHeight(80)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(getWidth(20)),
                      boxShadow: [
                        BoxShadow(
                          color: pallete.background().withOpacity(0.4),
                          offset: const Offset(0, 3),
                          blurRadius: 8,
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(getWidth(20)),
                      child: CachedNetworkImage(
                        imageUrl: box.read("photo"),
                        width: getWidth(40),
                      ),
                    ),
                  ),
                  SizedBox(width: getHeight(10)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        box.read("name"),
                        style: TextStyle(
                          color: pallete.background(),
                          fontSize: getWidth(16),
                        ),
                      ),
                      Text(
                        box.read("email"),
                        style: TextStyle(
                          color: pallete.background(),
                          fontSize: getWidth(12),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: getHeight(40)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
              child: Text(
                "BROWSE",
                style: TextStyle(
                  color: pallete.background().withOpacity(0.6),
                  fontSize: getWidth(16),
                ),
              ),
            ),
            SizedBox(height: getHeight(10)),
            const Divider(),
            SizedBox(height: getHeight(10)),
            DrawerCard(
              pallete: pallete,
              title: "Home",
              index: 0,
              current: current,
              iconPath: "assets/icons/home.svg",
              clicked: () async {
                fetchDataCountry('in')
                    .then((value) => print(value?.news[0].title));

                setState(() {
                  current = 0;
                });

                print("$current pressed");
              },
            ),
            SizedBox(height: getHeight(10)),
            DrawerCard(
              pallete: pallete,
              title: "Saved",
              index: 1,
              current: current,
              iconPath: "assets/icons/save.svg",
              clicked: () {
                setState(() {
                  current = 1;
                });
                print("$current pressed");
              },
            ),
            SizedBox(height: getHeight(10)),
            DrawerCard(
              pallete: pallete,
              title: "Alerts",
              index: 2,
              current: current,
              iconPath: "assets/icons/alerts.svg",
              clicked: () {
                setState(() {
                  current = 2;
                });
                print("$current pressed");
              },
            ),
            SizedBox(height: getHeight(10)),
            DrawerCard(
              pallete: pallete,
              title: "Profile",
              index: 3,
              current: current,
              iconPath: "assets/icons/profile.svg",
              clicked: () {
                setState(() {
                  current = 3;
                });
                print("$current pressed");
              },
            ),
            SizedBox(height: getHeight(40)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: getWidth(20)),
              child: Text(
                "OTHER",
                style: TextStyle(
                  color: pallete.background().withOpacity(0.6),
                  fontSize: getWidth(16),
                ),
              ),
            ),
            SizedBox(height: getHeight(10)),
            const Divider(),
            SizedBox(height: getHeight(10)),
            DrawerCard(
              pallete: pallete,
              title: "Theme",
              index: 4,
              current: current,
              iconPath: "assets/icons/theme.svg",
              clicked: () {
                setState(() {
                  current = 4;
                });

                print("$current pressed");
              },
            ),
            SizedBox(height: getHeight(10)),
            DrawerCard(
              pallete: pallete,
              title: "Settings",
              index: 5,
              current: current,
              iconPath: "assets/icons/settings.svg",
              clicked: () {
                setState(() {
                  current = 5;
                });

                print("$current pressed");
              },
            ),
            SizedBox(height: getHeight(10)),
            DrawerCard(
              pallete: pallete,
              title: "Log out",
              index: 6,
              current: current,
              iconPath: "assets/icons/logout.svg",
              clicked: () {
                print("$current pressed");
                UserAccount.googleLogout();
                Navigator.push(
                  context,
                  CustomPageRoute(
                    context,
                    const Welcome(),
                  ),
                );
              },
            ),
            SizedBox(height: getHeight(10)),
          ],
        ),
      ),
    );
  }
}

class DrawerCard extends StatelessWidget {
  const DrawerCard({
    Key? key,
    required this.pallete,
    required this.title,
    required this.iconPath,
    required this.clicked,
    required this.index,
    required this.current,
  }) : super(key: key);

  final Pallete pallete;
  final String title, iconPath;
  final VoidCallback clicked;
  final int index, current;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: InkWell(
        onTap: clicked,
        borderRadius: BorderRadius.circular(8),
        child: AnimatedContainer(
          duration: Global.drawerDuration,
          decoration: BoxDecoration(
            color: index == current ? pallete.primary() : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                SvgPicture.asset(
                  iconPath,
                  width: getWidth(22),
                  color: index == current ? Colors.white : pallete.background(),
                ),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                    color:
                        index == current ? Colors.white : pallete.background(),
                    fontSize: getWidth(16),
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
