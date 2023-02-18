import 'package:djhackathon/backend/database/api.dart';
import 'package:djhackathon/backend/database/spotlight.dart';
import 'package:djhackathon/backend/functions/fun.dart';
import 'package:djhackathon/frontend/home_content/components/shimmer.dart';
import 'package:djhackathon/theme.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../size.dart';
import '../../components/news_card.dart';

class PersonalisedBody extends StatefulWidget {
  const PersonalisedBody({super.key});

  @override
  State<PersonalisedBody> createState() => _PersonalisedBodyState();
}

class _PersonalisedBodyState extends State<PersonalisedBody> {
  int current = 0;
  bool isReady = false;
  late List<Spots> spots;
  List<String> tabs = [
    "Science",
    "Technology",
    "Business",
  ];
  void personalised(String title) {
    fetchData(title).then((value) {
      setState(() {
        isReady = true;
        spots = value!.spots;
      });
    });
  }

  void changeTab(int index) {
    setState(() {
      current = index;
      isReady = false;
    });
    personalised(index == 0 ? "all" : tabs[index - 1].toLowerCase());
  }

  int globalSum = 0;
  void getData() async {
    await getSum();
    final data =
        (globalSum == 0) ? await fetchDataForYou() : await fetchData('science');
    spots = data!.spots;
    setState(() {
      isReady = true;
    });
  }

  @override
  void initState() {
    // personalised("all");
    getData();
    super.initState();
  }

  Future<void> getSum() async {
    FirebaseDatabase database = FirebaseDatabase.instance;
    Fun fun = Fun(database);
    String email = GetStorage().read('email');
    email = email.replaceAll('.', '_');
    dynamic g = await fun.getData('users/$email/personalised');
    int sum = g['politics'] +
        g['business'] +
        g['sports'] +
        g['entertainment'] +
        g['science'] +
        g['technology'] +
        g['automobile'] +
        g['startup'];
    // print(sum);
    globalSum = sum;
  }

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return isReady
        ? Scaffold(
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
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: Column(
                          children: [
                            ...List.generate(
                              20,
                              (index) => isReady
                                  ? NewsCard(
                                      spot: spots[index],
                                      pallete: pallete,
                                      index: index,
                                      length: 20,
                                    )
                                  : NewsItemShimmer(index: index),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          )
        : Center(child: CircularProgressIndicator());
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
