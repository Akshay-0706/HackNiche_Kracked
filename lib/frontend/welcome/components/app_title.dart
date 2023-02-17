import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../size.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/icons/logo.svg"),
        SizedBox(width: getWidth(10)),
        Text(
          "Hackathon",
          style: TextStyle(
            color: Theme.of(context).primaryColorDark,
            fontSize: getWidth(24),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
