import 'package:flutter/material.dart';

import '../../global.dart';
import 'components/body.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const WelcomeBody(),
    );
  }
}
