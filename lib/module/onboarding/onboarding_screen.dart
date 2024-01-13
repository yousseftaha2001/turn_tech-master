import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:turn_tech/module/login/login_screen.dart';
import 'package:turn_tech/module/onboarding/onboarding_model.dart';

class OnBoardingScreen extends StatelessWidget {

  var onBoardingController = PageController();

  List<onBoardingModel> BoardingList =[
    onBoardingModel(
      image:'images/multitasking.png' ,
      title: 'Screen 1 title',
      body:'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
    ),
    onBoardingModel(
      image:'images/responsive.png' ,
      title: 'Screen 2 title',
      body:'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
    ),
    onBoardingModel(
      image:'images/programmer.png' ,
      title: 'Screen 3 title',
      body:'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(46,50,141,1),
        elevation: 0,
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(46,50,141,1),
          ),
          child: Padding(
            padding:  EdgeInsets.only(top:5.sp,bottom: 15.sp),
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: onBoardingController,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.all(1.sp),
                            child: Stack(
                               children: [
                                 SizedBox(
                                   width: double.infinity,
                                   height: 310.h,
                                 ),
                                 Center(
                                   child: Image(
                                     image: AssetImage('${BoardingList[index].image}'),
                                     width: 300.w,
                                     height: 300.h,
                                   ),
                                 ),
                               ],
                            ),
                          ),

                          Center(
                            child: Text(
                              '${BoardingList[index].title}',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 25.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Center(
                            child: Padding(
                              padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                              child: Text(
                                '${BoardingList[index].body}',
                                maxLines: 6,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                color: Color.fromRGBO(193, 191, 194, 1),
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                              ),
                              ),
                            ),
                          ),

                        ],
                      );
                    },
                    itemCount: BoardingList.length,
                  ),
                ),
                SizedBox(height: 20.h,),

                InkWell(
                  onTap: () async {
                    Get.off(LoginScreen());
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 80.sp),
                    child: Container(
                      width: double.infinity,
                      height: 45.h,
                      decoration: BoxDecoration(
                        // boxShadow: [
                        //   BoxShadow(
                        //     color: Colors.grey,
                        //     offset: Offset(0, 4), // Offset in the x and y directions
                        //     blurRadius: 6.0,
                        //   ),
                        // ],
                        // color: Color.fromRGBO(46,50,141,1),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25.r),
                      ),
                      child: Center(
                        child: Text(
                          'Get Started',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15.h,),
                SmoothPageIndicator(
                  controller: onBoardingController,
                  effect: ExpandingDotsEffect(
                    dotColor: Color.fromRGBO(193, 191, 194, 1),
                    activeDotColor: Colors.yellow,
                    dotHeight: 7,
                    expansionFactor: 3,
                    dotWidth: 8,
                    spacing: 5,
                  ),
                  count: BoardingList.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


