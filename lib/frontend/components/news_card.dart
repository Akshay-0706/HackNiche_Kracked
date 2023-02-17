import 'dart:math';

import 'package:flutter/material.dart';
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
    return Column(
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
    );
  }
}
