import 'package:djhackathon/theme.dart';
import 'package:flutter/material.dart';

import '../../../size.dart';

class PersonalisedBody extends StatefulWidget {
  const PersonalisedBody({super.key});

  @override
  State<PersonalisedBody> createState() => _PersonalisedBodyState();
}

class _PersonalisedBodyState extends State<PersonalisedBody> {
  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(
                "Personalised",
                style: TextStyle(
                  color: pallete.primaryDark(),
                  fontSize: getWidth(22),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
