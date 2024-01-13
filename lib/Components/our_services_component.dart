import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget OurServices({required String number , required String text}) => Column(
  children: [
    Padding(
      padding:  EdgeInsets.symmetric(horizontal: 100.sp),
      child: Divider(thickness: 2,color: Color.fromRGBO(46,50,141,1),),
    ),
    Text('${number}+',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 30.sp),),
    Text('${text}',style: TextStyle(fontSize: 13.sp,fontWeight: FontWeight.w400),textAlign: TextAlign.center,),
    SizedBox(height: 25.h,)
  ],
);




