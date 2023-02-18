import 'dart:math';

import 'package:djhackathon/frontend/components/custom_page_route.dart';
import 'package:djhackathon/frontend/news/news.dart';
import 'package:djhackathon/backend/functions/fun.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

import '../../backend/database/spotlight.dart';
import '../../size.dart';
import '../../theme.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({
    Key? key,
    required this.spot,
    required this.pallete,
    required this.index,
    required this.length,
  }) : super(key: key);

  final Spots spot;
  final Pallete pallete;
  final int index, length;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        FirebaseDatabase database = FirebaseDatabase.instance;
        Fun fun = Fun(database);
        String email = GetStorage().read('email');
        email = email.replaceAll('.', '_');
        dynamic g = await fun.getData('users');
        // print(g[email]['personalised']);

        g[email]['personalised'][spot.category] =
            g[email]['personalised'][spot.category] + 1;

        Map<String, Object> s = {
          email: {
            "personalised": {
              "business": g[email]['personalised']["business"],
              "sports": g[email]['personalised']["sports"],
              "startup": g[email]['personalised']["startup"],
              "entertainment": g[email]['personalised']["entertainment"],
              "politics": g[email]['personalised']["politics"],
              "technology": g[email]['personalised']["technology"],
              "science": g[email]['personalised']["science"],
              "automobile": g[email]['personalised']["automobile"],
            }
          }
        };
        dynamic s1 = await fun.updateData('users', s);
        print(s1);
      },
      child: Column(
        children: [
          if (index == 0) SizedBox(height: getWidth(20)),
          Container(
            height: getHeight(120),
            decoration: BoxDecoration(
              color: pallete.background(),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: pallete.primaryDark().withOpacity(0.4),
                  offset: const Offset(0, 3),
                  blurRadius: 8,
                )
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    width: getWidth(60),
                    height: getWidth(120),
                    decoration: BoxDecoration(
                      color: pallete.primaryDark().withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        spot.img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            spot.title,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              color: pallete.primaryDark(),
                              fontSize: getWidth(14),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateFormat.jm().format(spot.time).toLowerCase(),
                                style: TextStyle(
                                  color: pallete.primaryDark().withOpacity(0.8),
                                  fontSize: getWidth(12),
                                ),
                              ),
                              Text(
                                "${Random().nextInt(500 + 2)} Views",
                                style: TextStyle(
                                  color: pallete.primaryDark().withOpacity(0.8),
                                  fontSize: getWidth(12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          if (index != length - 1) SizedBox(height: getWidth(20)),
        ],
      ),
    );
  }
}
