import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'signin_dialog.dart';
import 'splash_content.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody> {
  double begin = 0, end = 1;
  int splashDuration = 900;
  late bool signedIn;

  @override
  void initState() {
    signedIn = GetStorage().read('signedIn') ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: begin, end: end),
        duration: Duration(milliseconds: splashDuration),
        onEnd: () {
          if (end != 0) {
            Future.delayed(Duration(milliseconds: splashDuration), () {
              setState(() {
                begin = 1;
                end = 0;
              });
            });
          }
          if (end == 0 && !signedIn) {
            Navigator.pushReplacementNamed(context, "/welcome");
          }
        },
        builder: (BuildContext context, double opacity, Widget? child) {
          return end == 0 && opacity == 0 && signedIn
              ? const SigninDialog()
              : SplashContent(opacity: opacity);
        },
      ),
    );
  }
}
