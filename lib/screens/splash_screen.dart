import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:inter_iit_dream11/screens/dashboard.dart';
import 'package:page_transition/page_transition.dart';

import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  late double screenHeight;
  late double screenWidth;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return AnimatedSplashScreen.withScreenFunction(
      splash: "assets/logo.png",
      splashIconSize: screenWidth*0.5,
      screenFunction: () async {
          return const Dashboard();
        },
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
    );
  }
}
