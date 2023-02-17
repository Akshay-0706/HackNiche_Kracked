import 'package:djhackathon/frontend/personalised/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Personalised extends StatelessWidget {
  const Personalised({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersonalisedBody(),
    );
  }
}
