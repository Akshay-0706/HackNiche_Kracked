import 'package:djhackathon/backend/database/spotlight.dart';
import 'package:djhackathon/size.dart';
import 'package:djhackathon/theme.dart';
import 'package:flutter/material.dart';

class NewsBody extends StatelessWidget {
  const NewsBody({super.key, required this.spots});
  final Spots spots;

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/mumbai.png",
                  height: getWidth(400),
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    borderRadius: BorderRadius.circular(17),
                    child: Container(
                      decoration: BoxDecoration(
                        color: pallete.primaryDark(),
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: pallete.background(),
                          size: getWidth(20),
                        ),
                      ),
                    ),
                  ),
                ),
                Container()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
