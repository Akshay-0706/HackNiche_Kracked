import 'package:flutter/material.dart';

import 'components/body.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});


  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SideMenuBody(
      ),
    );
  }
}
