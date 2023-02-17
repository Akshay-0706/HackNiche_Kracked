import 'package:flutter/material.dart';

import '../../size.dart';
import 'components/body.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig(context);
    return const Scaffold(
      body: SplashBody(),
    );
  }
}
