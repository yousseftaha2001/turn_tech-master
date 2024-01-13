import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:turn_tech/module/Home/home_screen.dart';
import 'package:turn_tech/module/Layout/layout.dart';
import 'package:turn_tech/module/login/login_screen.dart';
import 'package:turn_tech/module/onboarding/onboarding_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Image.asset('images/Logo-removebg.png'),
      nextScreen: OnBoardingScreen(),
      animationDuration: Duration(seconds: 1),
      centered: true,
      // splashTransition: SplashTransition.scaleTransition,
      // pageTransitionType: PageTransitionType.scale,
      splashIconSize: 200.sp,
      duration: 1,
    );
  }
}
