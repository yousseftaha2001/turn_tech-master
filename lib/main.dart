import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:turn_tech/firebase_options.dart';
import 'package:turn_tech/module/Home/home_screen.dart';
import 'package:turn_tech/module/Layout/layout.dart';
import 'package:turn_tech/module/OTP/otp_screen.dart';
import 'package:turn_tech/module/OurServices/our_services_screen.dart';
import 'package:turn_tech/module/login/login_screen.dart';
import 'package:turn_tech/module/onboarding/onboarding_screen.dart';
import 'package:turn_tech/module/signUp/sign_up_screen.dart';
import 'package:turn_tech/module/splash/splash_screen.dart';
import 'module/About_Us/about_us_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("Before Firebase.initializeApp()");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print("After Firebase.initializeApp()");
  // options: DefaultFirebaseOptions.currentPlatform

  // options: FirebaseOptions(
  //     apiKey: "AIzaSyACdfEsV4q_1AFpR_ULDydsMX83V0ddoOw",
  //     appId: "1:128203340466:web:9226787e813f59b2ca27ab",
  //     messagingSenderId: "128203340466",
  //     projectId: "turntech-af9a8"
  // )
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home:Layout(),
        );
      },

    );
  }
}


