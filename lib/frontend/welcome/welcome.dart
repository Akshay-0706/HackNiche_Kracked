import 'package:flutter/material.dart';

import '../../global.dart';
import 'components/body.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeChanger.isDarkMode
          ? const Color(0xff00332B)
          : const Color(0xffA3DA8D),
      body: const WelcomeBody(),
    );
  }
}
