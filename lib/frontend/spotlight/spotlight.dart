import 'package:djhackathon/frontend/spotlight/components/body.dart';
import 'package:flutter/material.dart';

import '../../backend/database/spotlight.dart';

class SpotLight extends StatelessWidget {
  const SpotLight({super.key, required this.spots});
  final List<Spots> spots;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SpotLightBody(spots: spots),
    );
  }
}
