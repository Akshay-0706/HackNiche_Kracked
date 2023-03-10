import 'package:djhackathon/frontend/country/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Country extends StatelessWidget {
  const Country({super.key, required this.country, required this.code});
  final String country;
  final String code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CountryBody(country: country, code: code),
    );
  }
}
