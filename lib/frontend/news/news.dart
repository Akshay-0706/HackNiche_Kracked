import 'package:djhackathon/backend/database/spotlight.dart';
import 'package:djhackathon/frontend/news/components/body.dart';
import 'package:flutter/material.dart';

class News extends StatelessWidget {
  const News({super.key, required this.spots});
  final Spots spots;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewsBody(spots: spots),
    );
  }
}
