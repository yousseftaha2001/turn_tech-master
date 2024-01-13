import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget OTP ({context, required OTPController,required first,required last}) => Container(
  width: 50.w,
  height: 50.h,
  decoration: BoxDecoration(
    color: Colors.grey.shade300,
    borderRadius: BorderRadius.circular(5.r),
    border: Border.all(
      color: Color.fromRGBO(217, 219, 221, 1),
      width: 1.w,
    ),
  ),
  child: TextFormField(
    onChanged: (value){
      if(value.isNotEmpty && last == false)
        {
          FocusScope.of(context).nextFocus();
        }else if(value.isEmpty && first == false)
          {
            FocusScope.of(context).previousFocus();
          }
    },
    style: TextStyle(
        fontSize: 20.sp
    ),
    controller: OTPController,
    textAlign: TextAlign.center,
    cursorColor: Colors.grey,
    keyboardType: TextInputType.number,
    inputFormatters: [LengthLimitingTextInputFormatter(1)],
    decoration: InputDecoration(
      border: InputBorder.none,
    ),
  ),
);