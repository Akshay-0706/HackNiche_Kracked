import 'dart:math';

import 'package:djhackathon/size.dart';
import 'package:djhackathon/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CountryBody extends StatefulWidget {
  const CountryBody({super.key, required this.country});
  final String country;

  @override
  State<CountryBody> createState() => _CountryBodyState();
}

class _CountryBodyState extends State<CountryBody> {
  int current = 0, length = 7;
  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: getHeight(40)),
        child: Container(
          decoration: BoxDecoration(
            color: pallete.primaryDark(),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(getWidth(20)),
              topRight: Radius.circular(getWidth(20)),
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  "https://www.europeanscientist.com/wp-content/uploads/2022/04/46385A43-4ABE-46E7-8556-37B944126F7F.jpeg",
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
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.8),
                    ],
                    stops: const [
                      0.0,
                      0.1,
                      0.2,
                      0.3,
                      0.7,
                      0.9,
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          length,
                          (index) => CardBar(
                            pallete: pallete,
                            index: index,
                            current: current,
                            length: length,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Hello");
                            Navigator.pop(context);
                          },
                          child: Transform.rotate(
                            angle: pi / 4,
                            child: Icon(
                              Icons.add_rounded,
                              color: pallete.background(),
                              size: getWidth(30),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      "Fabulous duo",
                      style: TextStyle(
                        color: pallete.background(),
                        fontSize: getWidth(24),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: getWidth(10)),
                    Text(
                      "Sidharth wore a yellow kurta layered with a colourful floral shawl. Sidharth wore a yellow kurta layered with a colourful floral shawl. Sidharth wore a yellow kurta layered with a colourful floral shawl. Sidharth wore a yellow kurta layered with a colourful floral shawl. Sidharth wore a yellow kurta layered with a colourful floral shawl. Sidharth wore a yellow kurta layered with a colourful floral shawl.",
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: pallete.background().withOpacity(0.8),
                        fontSize: getWidth(16),
                      ),
                    ),
                    SizedBox(height: getWidth(20)),
                  ],
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (current > 0) current--;
                      });
                    },
                    child: Container(
                      width: SizeConfig.width * 0.5,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(getWidth(20)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          if (current < length - 1) current++;
                        });
                      },
                      child: Container(
                        width: SizeConfig.width * 0.5,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(getWidth(20)),
                          ),
                        ),
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

class CardBar extends StatelessWidget {
  const CardBar({
    Key? key,
    required this.pallete,
    required this.index,
    required this.current,
    required this.length,
  }) : super(key: key);

  final Pallete pallete;
  final int index, current, length;
  final double horizontal = 5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: horizontal, vertical: 20),
      child: Container(
        width: (SizeConfig.width -
                (horizontal * 2 * (length - 1) + (horizontal * 2) + 40)) /
            length,
        height: 4,
        decoration: BoxDecoration(
          color: index == current
              ? pallete.background()
              : pallete.background().withOpacity(0.4),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}
