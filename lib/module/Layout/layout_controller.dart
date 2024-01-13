import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turn_tech/module/About_Us/about_us_screen.dart';
import 'package:turn_tech/module/Home/home_screen.dart';
import 'package:turn_tech/module/Notification/notification_screen.dart';
import 'package:turn_tech/module/Request/request_screen.dart';
import 'package:turn_tech/module/services/services_screen.dart';

class LayoutController extends GetxController{
  List <Widget> Screens = [
    HomeScreen(),
    ServicesScreen(),
    RequestScreen(),
    AboutUsScreen(),
    NotificationScreen(),
  ];

  var SelectIndex = 0.obs ;

  void ChangeBottomNav(int index)
  {
    SelectIndex.value = index;
  }
}