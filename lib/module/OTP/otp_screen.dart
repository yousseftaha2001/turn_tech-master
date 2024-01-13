import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:turn_tech/module/login/login_controller.dart';

import '../../Components/otp_textfield_component.dart';

class OTPScreen extends StatelessWidget {

  OTPScreen({required this.veryId});
  late String veryId;

  var c1 = TextEditingController();

  var c2 = TextEditingController();

  var c3 = TextEditingController();

  var c4 = TextEditingController();

  var c5 = TextEditingController();

  var c6 = TextEditingController();

  var controller = Get.put(LoginController());

  // @override
  bool isFirst = false;

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(15.sp),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'Verification Code',
                style: TextStyle(
                  color: Color.fromRGBO(46,50,141,1),
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Text(
                '${controller.phoneNum.toString()}',
                style: TextStyle(
                  color: Color.fromRGBO(46,50,141,1),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),

              SizedBox(height: 50.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OTP(context: context,OTPController: c1,first: true,last:false ),
                  OTP(context: context,OTPController: c2,first: false,last:false ),
                  OTP(context: context,OTPController: c3,first: false,last:false ),
                  OTP(context: context,OTPController: c4,first: false,last:false ),
                  OTP(context: context,OTPController: c5,first: false,last:false ),
                  OTP(context: context,OTPController: c6,first: false,last:true ),
                ],
              ),
              SizedBox(height: 100.h,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                child: InkWell(
                  onTap: () async {
                    // print(controller.phoneNum.toString());
                    //await controller.phoneAuth( phoneNum: controller.phoneNum!.toString(), controller: '${c1.text + c2.text + c3.text + c4.text + c5.text }');
                    // await controller.sentCode(controller:   '${c1.text + c2.text + c3.text + c4.text + c5.text }');
                    print('${c1.text + c2.text + c3.text + c4.text + c5.text+c6.text }');
                    await controller.signInWithPhoneNumber(smsCode: '${c1.text+c2.text+c3.text+c4.text+c5.text+c6.text}',verificationId: veryId );

                  },
                  child: Container(
                    width: double.infinity,
                    height: 50.h,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 4),
                          blurRadius: 6.0,
                        ),
                      ],
                      color: Color.fromRGBO(46,50,141,1),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Center(
                      child: Text(
                        'Confirm',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t receive any code?',
                    style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500
                    ),
                  ),

                  TextButton(
                      onPressed: (){

                      },
                      child: Text('Send again',style: TextStyle(color: Color.fromRGBO(46,50,141,1) ),)
                  ),

                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
