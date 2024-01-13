import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 246, 1),
      appBar: AppBar(title: Text('Ps rofile'),centerTitle: true,),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding:  EdgeInsets.only(top: 50.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Full Name',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'momen',
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.9,),
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            'momen@gmail.com',
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.9,),
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.w,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Phone',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12.sp,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            '01024137763',
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 0.9,),
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),





                //SizedBox(height :80.h),
                //Spacer(),
                // Container(
                //   width: 271.w,
                //   height: 49.h,
                //   decoration: BoxDecoration(
                //       color: Color.fromRGBO(46,50,141,1),
                //       borderRadius: BorderRadius.circular(100.sp)
                //   ) ,
                //   child: Center(
                //     child: Text(
                //       'Edit Profile',
                //       style: TextStyle(
                //           color: Colors.white,
                //           fontSize: 16.sp
                //       ),
                //     ),
                //
                //   ),
                // ),
               // SizedBox(height: 20.h,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
