import 'package:drop_shadow/drop_shadow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

import '../../../size.dart';

class SplashContent extends StatelessWidget {
  const SplashContent({
    Key? key,
    required this.opacity,
  }) : super(key: key);
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // DropShadow(
        //   opacity: 0.5,
        //   blurRadius: 7,
        //   offset: const Offset(0, 5),
        //   child: Opacity(
        //     opacity: opacity,
        //     child: Image.asset(
        //       "assets/images/logo.png",
        //       width: getWidth(80),
        //     ),
        //   ),
        // ),
        SizedBox(
          width: getWidth(160),
          height: getWidth(160),
          child: LottieBuilder.asset(
            "assets/extras/lottie_logo.json",
            repeat: true,
          ),
        ),
        SizedBox(height: 10),
        Opacity(
          opacity: opacity,
          child: Text(
            "Eco-Quest",
            style: TextStyle(
              color: Theme.of(context).primaryColorDark,
              fontSize: getHeight(20),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
