import 'package:djhackathon/theme.dart';
import 'package:flutter/material.dart';

import '../../../size.dart';
import '../../components/news_card.dart';

class PersonalisedBody extends StatefulWidget {
  const PersonalisedBody({super.key});

  @override
  State<PersonalisedBody> createState() => _PersonalisedBodyState();
}

class _PersonalisedBodyState extends State<PersonalisedBody> {
  int current = 0;

  List<String> tabs = [
    "Science",
    "Technology",
    "Gaming",
  ];

  void changeTab(int index) {
    setState(() {
      current = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getWidth(20)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Personalised",
                style: TextStyle(
                  color: pallete.primaryDark(),
                  fontSize: getWidth(22),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: getWidth(20)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      4,
                      (index) => TabItem(
                        pallete: pallete,
                        index: index,
                        current: current,
                        onClicked: changeTab,
                        title: index == 0 ? "For you" : tabs[index - 1],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      ...List.generate(
                        10,
                        (index) => NewsCard(
                          pallete: pallete,
                          index: index,
                          length: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TabItem extends StatelessWidget {
  const TabItem({
    Key? key,
    required this.pallete,
    required this.index,
    required this.current,
    required this.onClicked,
    required this.title,
  }) : super(key: key);

  final Pallete pallete;
  final int index, current;
  final Function onClicked;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => onClicked(index),
          child: Container(
            decoration: BoxDecoration(
                color: index == current
                    ? pallete.primaryDark()
                    : pallete.background(),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: index == current
                      ? Colors.transparent
                      : pallete.primaryDark(),
                )),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                title,
                style: TextStyle(
                  color: index == current
                      ? pallete.background()
                      : pallete.primaryDark(),
                  fontSize: getWidth(18),
                ),
              ),
            ),
          ),
        ),
        if (index != 3) SizedBox(width: getWidth(10)),
      ],
    );
  }
}
