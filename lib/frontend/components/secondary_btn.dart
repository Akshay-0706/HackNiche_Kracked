import 'package:flutter/material.dart';

import '../../size.dart';

class SecondaryBtn extends StatelessWidget {
  const SecondaryBtn({
    Key? key,
    required this.color,
    required this.padding,
    required this.title,
    required this.tap,
  }) : super(key: key);
  final Color color;
  final double padding;
  final String title;
  final GestureTapCallback tap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: InkWell(
        onTap: tap,
        borderRadius: BorderRadius.circular(20),
        splashColor: color,
        child: Ink(
          height: getHeight(50),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: color,
              boxShadow: [
                BoxShadow(
                    color: color.withOpacity(0.5),
                    blurRadius: 5,
                    offset: const Offset(0, 1))
              ]),
          child: Center(
              child: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontSize: getWidth(16),
                fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
