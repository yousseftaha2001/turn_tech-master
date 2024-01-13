import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:turn_tech/module/History/history_screen.dart';
import 'package:turn_tech/module/Home/home_screen.dart';
import 'package:turn_tech/module/Profile/profile_screen.dart';
import 'package:turn_tech/module/Settings/settings_screen.dart';
import 'package:turn_tech/module/login/login_controller.dart';
import 'package:turn_tech/module/login/login_screen.dart';
import 'layout_controller.dart';


class Layout extends StatelessWidget {

  var HomeLayoutController = Get.put(LayoutController());
  var authController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LayoutController>(
      builder: (controller) {
        return Scaffold(

          appBar: AppBar(
            actions: [
              IconButton(onPressed:  (){}, icon: Icon(Icons.notifications_none_outlined)),
              IconButton(onPressed: (){
                Get.to(ProfileScreen());
              }, icon: Icon(IcoFontIcons.businessManAlt1)),
            ],
          ),
          drawer: Drawer(
            backgroundColor: Color.fromRGBO(46,50,141,1),
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // DrawerHeader(
                //   decoration: BoxDecoration(
                //     color: Colors.blue,
                //   ),
                //   child: Text('Drawer Header'),
                // ),
                SizedBox(height: 150.h,),
                ListTile(
                  title: InkWell(
                    onTap: (){
                      Get.back();
                      controller.ChangeBottomNav(0);
                      // Get.off(Layout().HomeLayoutController.SelectIndex.value);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.home,color: Colors.white,),
                        SizedBox(width: 10.w,),
                        Text(
                          'Home',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),


                ),
                ListTile(
                  title: InkWell(
                    onTap: (){
                      Get.back();
                      controller.ChangeBottomNav(1);
                      // Get.off(Layout().HomeLayoutController.SelectIndex.value);
                    },
                    child: Row(
                      children: [
                        Icon(LineAwesomeIcons.screwdriver,color: Colors.white,),
                        SizedBox(width: 10.w,),
                        Text(
                          'Services',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),


                ),
                ListTile(
                  title: InkWell(
                    onTap: (){
                      Get.back();
                      controller.ChangeBottomNav(2);
                      // Get.off(Layout().HomeLayoutController.SelectIndex.value);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.add,color: Colors.white,),
                        SizedBox(width: 10.w,),
                        Text(
                          'Request',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),


                ),
                ListTile(
                  title: InkWell(
                    onTap: (){
                      // Get.off(Layout().HomeLayoutController.SelectIndex.value);
                    },
                    child: Row(
                      children: [
                        Icon(MdiIcons.codeBraces,color: Colors.white,),
                        SizedBox(width: 10.w,),
                        Text(
                          'Our Projects',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),


                ),
                ListTile(
                  title: InkWell(
                    onTap: (){
                      Get.back();
                      Get.to(HistoryScreen());
                    },
                    child: Row(
                      children: [
                        Icon(MdiIcons.history,color: Colors.white,),
                        SizedBox(width: 10.w,),
                        Text(
                          'History',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),


                ),
                ListTile(
                  title: InkWell(
                    onTap: (){
                      Get.back();
                      Get.to(SettingsScreen());
                      // Get.off(Layout().HomeLayoutController.SelectIndex.value);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.settings,color: Colors.white,),
                        SizedBox(width: 10.w,),
                        Text(
                          'Settings',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),


                ),

                ListTile(
                  title: InkWell(
                    onTap: (){
                      Get.back();
                      controller.ChangeBottomNav(3);
                      // Get.off(Layout().HomeLayoutController.SelectIndex.value);
                    },
                    child: Row(
                      children: [
                        Icon(LineAwesomeIcons.question,color: Colors.white,),
                        SizedBox(width: 10.w,),
                        Text(
                          'About Us',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),


                ),


                ListTile(
                  title: InkWell(
                    onTap: ()async{
                      Get.back();
                      await authController.signOut();
                      Get.off(LoginScreen());
                    },
                    child: Row(
                      children: [
                        Icon(Icons.logout_outlined,color: Colors.white,),
                        SizedBox(width: 10.w,),
                        Text(
                          'Logout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                  ),


                ),


              ],
            ),
          ),
          body: Obx(()
          {
            return controller.Screens[controller.SelectIndex.value];

          }),

          bottomNavigationBar: Obx(
                () {
              return BottomNavigationBar(
                currentIndex: controller.SelectIndex.value,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.grey.shade200,
                onTap: (index){
                  controller.ChangeBottomNav(index);
                },
                unselectedItemColor: Colors.black,
                selectedItemColor: Color.fromRGBO(46,50,141,1),

                items: const [
                  BottomNavigationBarItem(icon: Icon(LineAwesomeIcons.home),label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(LineAwesomeIcons.screwdriver),label: 'Services'),
                  BottomNavigationBarItem(icon: Icon(Icons.add,color: Colors.green,),label: 'Request'),
                  BottomNavigationBarItem(icon: Icon(LineAwesomeIcons.question),label: 'About Us'),
                  BottomNavigationBarItem(icon: Icon(Icons.notifications_none_outlined),label: 'Notifications'),
                ],);
            },
          ),
        );
      },
    );
  }
}

