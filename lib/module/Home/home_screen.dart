import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:turn_tech/module/Home/home_controller.dart';
import 'package:turn_tech/module/Home/home_model.dart';
import 'package:turn_tech/module/OurServices/our_services_screen.dart';


class HomeScreen extends StatelessWidget {

  final List<String> imageList = [
    'images/Logo-removebg.png',
    'images/Logo-removebg.png',
    'images/Logo-removebg.png',
    'images/Logo-removebg.png',
    'images/Logo-removebg.png',
  ];

  List<homeModel> homeList = [
    homeModel(
        title: 'Mobile Application Development',
        body: 'cleknclencwekncweeeeeeeecklnwjkencwke',
      image: 'images/mobile-application.png',
      icon: null,
    ),
    homeModel(
      title: 'Web Application Development',
      body: 'cleknclencwekncweeeeeeeecklnwjkencwke',
      image: null,
      icon: Icon(IcoFontIcons.web,size: 65.sp,color: Colors.blue),
    ),
    homeModel(
      title: 'Desktop Application',
      body: 'cleknclencwekncweeeeeeeecklnwjkencwke',
      image: null,
      icon : Icon(MdiIcons.remoteDesktop,size: 60.sp,color: Colors.green,),
    ),
    homeModel(
      title: 'Software',
      body: 'cleknclencwekncweeeeeeeecklnwjkencwke',
      image: 'images/computer.png',
      icon: null,
    ),
    homeModel(
      title: 'Hardware',
      body: 'cleknclencwekncweeeeeeeecklnwjkencwke',
      image: 'images/cpu.png',
      icon: null,
    ),
    homeModel(
      title: 'IT Services',
      body: 'cleknclencwekncweeeeeeeecklnwjkencwke',
      image: null,
      icon: Icon(Icons.router_outlined,size: 65.sp,color: Colors.red),
    ),
  ];

  var controller = PageController();

  var selectedServiceController = Get.put(HomeController());

  var IndicatorController = Get.put(HomeController());
  final CarouselController carouselController = CarouselController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.sp , vertical: 15.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                    'Welcome back',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                  ),
                ),
              ),
              SizedBox(height: 5.h,),
              Align(
                alignment: Alignment.topLeft,
                child: RichText(
                  text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Hi, ',
                          style: TextStyle(
                              fontSize: 25.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        TextSpan(
                          text: 'John Toxic',
                          style: TextStyle(
                            fontSize: 25.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        TextSpan(
                          text: '!',
                          style: TextStyle(
                            fontSize: 25.sp,
                            color: Colors.black,
                          ),
                        ),
                      ]
                  ),
                ),
              ),
              SizedBox(height: 10.h,),
              CarouselSlider(
                carouselController: carouselController,
                options: CarouselOptions(
                  height: 160.h,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 600),
                  enableInfiniteScroll: false,
                  viewportFraction: 0.8,
                  onPageChanged: (index, reason) async{
                    IndicatorController.currentPage.value = index;
                  },
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
               Obx(
                 () {
                   return AnimatedSmoothIndicator(
                     activeIndex:  IndicatorController.currentPage.value,
                     count: imageList.length,
                     effect: ExpandingDotsEffect(
                       dotColor: Color.fromRGBO(193, 191, 194, 1),
                       activeDotColor: Color.fromRGBO(46,50,141,1),
                       dotHeight: 7,
                       expansionFactor: 3,
                       dotWidth: 8,
                       spacing: 5,
                     ),
                     axisDirection: Axis.horizontal,
                   );
                 },

               ),
              SizedBox(height: 40.h,),

              Row(
                children: [
                   Text(
                      'Our Services',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h,),


              GridView.builder(
                  physics: const BouncingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                    crossAxisSpacing:8.sp,
                    mainAxisSpacing: 8.sp,
                  ),
                  itemCount: homeList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: (){
                        selectedServiceController.selectedService = index;
                        Get.to(OurServicesScreen());
                      },
                      child: Container(
                        width: 200.w,
                        height: 300.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade200,
                        ),
                        child: Padding(
                          padding:  EdgeInsets.all(15.sp),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              homeList[index].icon == null ?Image(height:60.h,width: 60.w, image: AssetImage('${homeList[index].image}') ) : homeList[index].icon ?? Container(),
                              SizedBox(height: 10.h,),
                              Text(
                                '${homeList[index].title}',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),

              // Row(
              //   children: [
              //     Expanded(
              //       child: Container(
              //         width: 200.w,
              //         height: 140.h,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(8),
              //           color: Colors.grey.shade200,
              //         ),
              //         child: Padding(
              //           padding:  EdgeInsets.all(15.sp),
              //           child: Column(
              //             children: [
              //               Image(height:60.h,width: 60.w,image: AssetImage('images/mobile-application.png')),
              //               SizedBox(height: 10.h,),
              //               Text(
              //                 'Mobile Application Development',
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                   fontSize: 14.sp,
              //                   fontWeight: FontWeight.w600
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     SizedBox(width: 10.w,),
              //     Expanded(
              //       child: Container(
              //         width: 200.w,
              //         height: 140.h,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(8.r),
              //           color: Colors.grey.shade200,
              //         ),
              //         child: Padding(
              //           padding:  EdgeInsets.all(15.sp),
              //           child: Column(
              //             children: [
              //               Icon(IcoFontIcons.web,size: 65.sp,color: Colors.blue,),
              //               SizedBox(height: 5.h,),
              //               Text(
              //                 'Web Application Development',
              //                 overflow: TextOverflow.ellipsis,
              //                 textAlign: TextAlign.center,
              //                 maxLines: 3,
              //                 style: TextStyle(
              //                     fontSize: 14.sp,
              //                     fontWeight: FontWeight.w600
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              // SizedBox(height: 15.h,),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Container(
              //         width: 200.w,
              //         height: 140.h,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(8.r),
              //           color: Colors.grey.shade200,
              //         ),
              //         child: Padding(
              //           padding:  EdgeInsets.all(15.sp),
              //           child: Column(
              //             children: [
              //                Icon(MdiIcons.remoteDesktop,size: 60.sp,color: Colors.green,),
              //               SizedBox(height: 10.h,),
              //               Text(
              //                 'Desktop Application',
              //                 maxLines: 2,
              //                 overflow: TextOverflow.ellipsis,
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                     fontSize: 14.sp,
              //                     fontWeight: FontWeight.w600
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     SizedBox(width: 10.h,),
              //     Expanded(
              //       child: Container(
              //         width: 200.w,
              //         height: 140.h,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(8.r),
              //           color: Colors.grey.shade200,
              //         ),
              //         child: Padding(
              //           padding:  EdgeInsets.all(15.sp),
              //           child: Column(
              //             children: [
              //               Image(height:60.h,width: 60.w,image: AssetImage('images/computer.png')),
              //               SizedBox(height: 10.h,),
              //               Text(
              //                 'Software',
              //                 overflow: TextOverflow.ellipsis,
              //                 textAlign: TextAlign.center,
              //                 maxLines: 3,
              //                 style: TextStyle(
              //                     fontSize: 14.sp,
              //                     fontWeight: FontWeight.w600
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              // SizedBox(height: 15.h,),
              // Row(
              //   children: [
              //     Expanded(
              //       child: Container(
              //         width: 200.w,
              //         height: 140.h,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(8.r),
              //           color: Colors.grey.shade200,
              //         ),
              //         child: Padding(
              //           padding:  EdgeInsets.all(15.sp),
              //           child: Column(
              //             children: [
              //               Image(height:60.h,width: 60.w,image: AssetImage('images/cpu.png')),
              //               SizedBox(height: 10.h,),
              //               Text(
              //                 'Hardware',
              //                 maxLines: 2,
              //                 overflow: TextOverflow.ellipsis,
              //                 textAlign: TextAlign.center,
              //                 style: TextStyle(
              //                     fontSize: 14.sp,
              //                     fontWeight: FontWeight.w600
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //     SizedBox(width: 10.h,),
              //     Expanded(
              //       child: Container(
              //         width: 200.w,
              //         height: 140.h,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(8.r),
              //           color: Colors.grey.shade200,
              //         ),
              //         child: Padding(
              //           padding:  EdgeInsets.all(15.sp),
              //           child: Column(
              //             children: [
              //               Icon(Icons.router_outlined,size: 65.sp,color: Colors.red),
              //               SizedBox(height: 5.h,),
              //               Text(
              //                 'IT Services',
              //                 overflow: TextOverflow.ellipsis,
              //                 textAlign: TextAlign.center,
              //                 maxLines: 3,
              //                 style: TextStyle(
              //                     fontSize: 14.sp,
              //                     fontWeight: FontWeight.w600
              //                 ),
              //               )
              //             ],
              //           ),
              //         ),
              //       ),
              //     )
              //   ],
              // ),
              SizedBox(height: 30.h,),
              Row(
                children: [
                   Text(
                    'Our News',
                    style: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15.h,),
              Text(
                'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                overflow: TextOverflow.ellipsis,
              ),
                maxLines: 70,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(IcoFontIcons.mapPins,color: Color.fromRGBO(0, 123, 255, 1),size: 25.sp,),
          onPressed: (){
            selectedServiceController.openGoogleMaps( 30.06030940514154 , 31.050867636043556 );
          }
      ),
    );
  }
}
