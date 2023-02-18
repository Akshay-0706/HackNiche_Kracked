import 'package:djhackathon/backend/functions/fun.dart';
import 'package:djhackathon/frontend/screen/screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';

import '../../../backend/auth/account.dart';
import '../../../backend/auth/user_account.dart';
import '../../../size.dart';
import '../../components/custom_page_route.dart';
import '../../components/primary_btn.dart';
import 'app_title.dart';

class WelcomeBody extends StatefulWidget {
  const WelcomeBody({super.key});

  @override
  State<WelcomeBody> createState() => _WelcomeBodyState();
}

class _WelcomeBodyState extends State<WelcomeBody> {
  final box = GetStorage();
  bool signedIn = false, signin = false;

  @override
  void initState() {
    signedIn = box.read('signedIn') ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return false;
      },
      child: SafeArea(
        child: Stack(
          children: [
            SvgPicture.asset("assets/extras/welcome_star.svg"),
            Positioned(
                right: 0,
                child:
                    SvgPicture.asset("assets/extras/welcome_trs_circle.svg")),
            Positioned(
                right: 0,
                child:
                    SvgPicture.asset("assets/extras/welcome_trs_border.svg")),
            Positioned(
              top: SizeConfig.height * 0.15,
              child: Stack(
                alignment: AlignmentDirectional.centerStart,
                children: [
                  SvgPicture.asset("assets/extras/welcome_mls_circle.svg"),
                  SvgPicture.asset("assets/extras/welcome_mls_border.svg"),
                ],
              ),
            ),
            Positioned(
              top: SizeConfig.height * 0.4,
              right: 0,
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  SvgPicture.asset("assets/extras/welcome_mrs_circle.svg"),
                  SvgPicture.asset("assets/extras/welcome_mrs_border.svg"),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Spacer(),
                const Spacer(),
                LottieBuilder.asset(
                  "assets/extras/lottie_welcome.json",
                  repeat: false,
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getHeight(20)),
                  child: SizedBox(
                    width: getWidth(220),
                    child: Text(
                      "Welcome to News Flash",
                      style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: getWidth(22),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getHeight(20)),
                  child: Text(
                    "You can easily keep track of latest news and current affairs. Get latest news from our app, stay updated in your life.",
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                      fontSize: getWidth(14),
                    ),
                  ),
                ),
                SizedBox(height: getHeight(20)),
                if (!signin)
                  PrimaryBtn(
                    title: "Sign in with Google",
                    primaryColor: Theme.of(context).primaryColor,
                    secondaryColor:
                        Theme.of(context).primaryColor.withOpacity(0.8),
                    titleColor: Colors.white,
                    padding: getWidth(20),
                    hasIcon: true,
                    tap: () {
                      setState(() {
                        signin = true;
                      });
                      UserAccount.googleLogin().then((value) {
                        Account? user = value;
                        if (user != null) {
                          if (!signedIn || box.read('email') != user.email) {
                            box.write('name', user.name);
                            box.write('photo', user.photo);
                            box.write('email', user.email);
                            box.write('id', user.id);
                            box.write('token', user.token);
                            box.write('signedIn', true);
                          }
                          // print(GetStorage().read('email'));
                          // FirebaseDatabase database = FirebaseDatabase.instance;
                          // Fun fun = Fun(database);
                          // var email = GetStorage().read('email');
                          // email = email.replaceAll(".", "_");
                          // Map<String, Object> val = {
                          //   email: {
                          //     'personalised': {
                          //       'business': 0,
                          //       'sports': 0,
                          //       'economy': 0,
                          //     }
                          //   }
                          // };
                          // fun.updateData('users', val);
                          Navigator.push(
                            context,
                            CustomPageRoute(
                              context,
                              const Screen(),
                            ),
                          );
                        } else {
                          setState(() {
                            signin = false;
                          });
                        }
                      });
                    },
                  ),
                if (signin)
                  Center(
                    child: CircularProgressIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                SizedBox(height: getHeight(60)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
