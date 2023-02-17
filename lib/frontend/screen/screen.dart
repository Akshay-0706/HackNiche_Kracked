import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../const.dart';
import '../../size.dart';
import '../../theme.dart';
import '../home/home.dart';
import '../side_menu/side_menu.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation, borderAnimation, scaleAnimation;
  bool isSideMenuClosed = true;
  int current = 0;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Global.drawerDuration)
          ..addListener(() {
            setState(() {});
          });

    animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    borderAnimation = Tween<double>(begin: 0, end: 24).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void tabChanged(int index) {
    setState(() {
      current = index;
    });
  }

  void onClicked() {
    if (isSideMenuClosed) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
    setState(() {
      isSideMenuClosed = !isSideMenuClosed;
    });
  }

  @override
  Widget build(BuildContext context) {
    Pallete pallete = Pallete(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: pallete.primaryDark(),
        body: WillPopScope(
          onWillPop: () async {
            SystemNavigator.pop();
            return false;
          },
          child: Stack(
            children: [
              const SideMenu(),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(animation.value - 30 * animation.value * pi / 180),
                child: Transform.translate(
                  offset: Offset(
                    animation.value * SizeConfig.width * Global.drawerOffset,
                    0,
                  ),
                  child: Transform.scale(
                    scale: scaleAnimation.value,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                          Radius.circular(borderAnimation.value)),
                      child: GestureDetector(
                        onTap: () {
                          if (!isSideMenuClosed) onClicked();
                        },
                        child: Home(
                          tabChanged: tabChanged,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (current == 0)
                Positioned(
                  left: 20,
                  top: 20,
                  child: InkWell(
                    onTap: () {
                      // print("Tap");
                      // print(SizeConfig.width * Global.drawerOffset * -1);
                      onClicked();
                    },
                    borderRadius: BorderRadius.circular(17),
                    child: Icon(
                      isSideMenuClosed ? Icons.menu : Icons.close,
                      color: isSideMenuClosed
                          ? pallete.primaryDark()
                          : pallete.background(),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
