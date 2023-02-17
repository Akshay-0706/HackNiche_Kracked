import 'dart:math';

import 'package:djhackathon/size.dart';
import 'package:djhackathon/theme.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class HomeContentBody extends StatefulWidget {
  const HomeContentBody({super.key});

  @override
  State<HomeContentBody> createState() => _HomeContentBodyState();
}

class _HomeContentBodyState extends State<HomeContentBody> {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(getWidth(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
