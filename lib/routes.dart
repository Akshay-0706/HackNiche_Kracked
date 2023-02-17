import 'package:flutter/material.dart';

import 'frontend/screen/screen.dart';
import 'frontend/splash/splash.dart';
import 'frontend/welcome/welcome.dart';

Map<String, WidgetBuilder> routes = {
  "/": (context) => const Splash(),
  "/welcome": (context) => const Welcome(),
  "/screen": (context) => const Screen(),
};
