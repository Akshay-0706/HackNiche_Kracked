import 'package:flutter/material.dart';

import 'components/body.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeContentBody(),
    );
  }
}
