import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:turn_tech/module/About_Us/about_us_controller.dart';

class AboutUsScreen extends StatelessWidget {

  var controller = Get.put(AboutUsController());
  final List<String> imageList = [
    'images/Logo-removebg.png',
    'images/Logo-removebg.png',
    'images/Logo-removebg.png',
    'images/Logo-removebg.png',
    'images/Logo-removebg.png',
  ];
  final CarouselController carouselController = CarouselController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.all(15.sp),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselSlider(
                    carouselController: carouselController,
                    options: CarouselOptions(
                      height: 160.h,
                      enlargeCenterPage: true,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 4),
                      autoPlayAnimationDuration: Duration(milliseconds: 600),
                      enableInfiniteScroll: false,
                      viewportFraction: 0.8,

                    ),
                    items: imageList.map((assetName) {
                      return Container(
                        margin: EdgeInsets.all(5.sp),
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.r)),
                          child: Image.asset(
                            assetName,
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(15.sp),
                    child: Column(
                      children: [
                        Text(
                          'You have problem. We have solutions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                            'You have a business to run, but you spend most of your time putting out fires. How can your business thrive while you’re wrestling with hoses? Leave it to us. We put out fires and keep them from starting in the first place.',
                           maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12.sp,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  Text(
                      'About As',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                      'TurnTech is a technology partner leveraging the latest technologies and premier vendors in the design andsupport of IT infrastructure to produce better business outcomes to our clients.',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Text(
                      'Established in 2019, grew quickly in IT consulting and IT outsourcing, assisting small and medium sized businesses with their IT support and IT management needs acting in a virtual CIO role as your trusted adviser. Extended the portfolio through strategic partnerships to cover IT infrastructure and network implementation, business management tools, applications, and security solutions.',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  Text(
                    'Our Vision',
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    'is accelerating human development by uniting people, business and technology.',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  Text(
                    'Our Mission',
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Text(
                    'is to offer excellent service in each of our professional disciplines, in accordance with statutory practices, codes of conduct and integrity, thereby developing our team and providing a leading platform from which to service the built environment and in particular, our valued Clients. Whether it is a building project or IT operation management, TurnTech is a leading practice that will exceed expectations and set new standards!',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 30.h,),
                  Text(
                    'Why Choose Us?',
                    style: TextStyle(
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(
                      '1- Highly qualified staff\n2- Honest and flat-rate pricing\n3- 100% satisfaction guaranteedWide service area\n4- On-demand emergency Services',
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          controller.openWhatsAppChat('+201000086986');
                        },
                          child: Icon(MdiIcons.whatsapp , size: 40.sp,color: Colors.green,)
                      ),
                      SizedBox(width: 10.w,),
                      InkWell(
                        onTap: (){
                          controller.openWebsite('https://turntecheg.com');
                        },
                          child: Icon(IcoFontIcons.web,size: 40.sp,color: Colors.blue.shade900,)
                      ),
                      SizedBox(width: 10.w,),
                      InkWell(
                        onTap: (){
                          controller.openFacebookProfile('TURNTech.2018');
                        },
                          child: Icon(MdiIcons.facebook, size: 40.sp,color: Colors.blue.shade900,)
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h,),
                  Center(
                    child: Text(
                      'Copyright © 2024 TurnTech | Powered by TurnTech',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
          child: Icon(Icons.phone,color: Color.fromRGBO(0, 123, 255, 1),),
          onPressed: (){
          controller.CallCustomerService();
          }
      ),
    );
  }
}
