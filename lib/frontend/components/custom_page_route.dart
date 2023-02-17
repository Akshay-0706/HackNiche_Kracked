import 'package:flutter/material.dart';

class CustomPageRoute extends PageRoute {
  CustomPageRoute(this.context, this.child);
  final Widget child;
  final BuildContext context;

  @override
  Color? get barrierColor => Theme.of(context).backgroundColor;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 500);
}
