import 'package:djhackathon/theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../size.dart';

class SpotlightShimmer extends StatelessWidget {
  const SpotlightShimmer({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return Row(
      children: [
        Container(
          width: getWidth(240),
          height: getWidth(300),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // border: Border.all(color: pallete.primaryDark()),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Shimmer.fromColors(
                      baseColor: pallete.primaryLight(),
                      highlightColor: pallete.background(),
                      child: Container(
                        height: getWidth(60),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: pallete.primaryDark().withAlpha(20),
                        ),
                      ),
                    ),
                    SizedBox(height: getWidth(20)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Shimmer.fromColors(
                          baseColor: pallete.primaryLight(),
                          highlightColor: pallete.background(),
                          child: Container(
                            width: getWidth(60),
                            height: getWidth(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: pallete.primaryDark().withAlpha(20),
                            ),
                          ),
                        ),
                        Shimmer.fromColors(
                          baseColor: pallete.primaryLight(),
                          highlightColor: pallete.background(),
                          child: Container(
                            width: getWidth(60),
                            height: getWidth(20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: pallete.primaryDark().withAlpha(20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Shimmer.fromColors(
                baseColor: pallete.primaryLight().withOpacity(0.5),
                highlightColor: pallete.background().withOpacity(0.5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withAlpha(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (index < 3) SizedBox(width: getWidth(20)),
      ],
    );
  }
}

class NewsItemShimmer extends StatelessWidget {
  const NewsItemShimmer({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return Column(
      children: [
        Container(
          height: getWidth(120),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            // border: Border.all(color: pallete.primaryDark()),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                      baseColor: pallete.primaryLight(),
                      highlightColor: pallete.background(),
                      child: Container(
                        width: getWidth(60),
                        height: getWidth(120),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: pallete.primaryDark().withAlpha(20),
                        ),
                      ),
                    ),
                    SizedBox(width: getWidth(20)),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Shimmer.fromColors(
                            baseColor: pallete.primaryLight(),
                            highlightColor: pallete.background(),
                            child: Container(
                              height: getWidth(20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: pallete.primaryDark().withAlpha(20),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Shimmer.fromColors(
                                baseColor: pallete.primaryLight(),
                                highlightColor: pallete.background(),
                                child: Container(
                                  width: getWidth(60),
                                  height: getWidth(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: pallete.primaryDark().withAlpha(20),
                                  ),
                                ),
                              ),
                              Shimmer.fromColors(
                                baseColor: pallete.primaryLight(),
                                highlightColor: pallete.background(),
                                child: Container(
                                  width: getWidth(60),
                                  height: getWidth(20),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: pallete.primaryDark().withAlpha(20),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Shimmer.fromColors(
                baseColor: pallete.primaryLight().withOpacity(0.5),
                highlightColor: pallete.background().withOpacity(0.5),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.black.withAlpha(20),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (index < 9) SizedBox(height: getWidth(20)),
      ],
    );
  }
}
