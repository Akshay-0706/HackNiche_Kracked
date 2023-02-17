import 'package:flutter/material.dart';

import 'components/body.dart';

class Home extends StatelessWidget {
  const Home({super.key, required this.tabChanged});
  final Function tabChanged;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(
        tabChanged: tabChanged,
      ),
    );
  }
}
