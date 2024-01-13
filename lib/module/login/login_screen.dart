import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:turn_tech/module/Home/home_screen.dart';
import 'package:turn_tech/module/Layout/layout.dart';
import 'package:turn_tech/module/OTP/otp_screen.dart';
import 'package:turn_tech/module/login/login_controller.dart';
import 'package:turn_tech/module/signUp/sign_up_screen.dart';

class LoginScreen extends StatelessWidget {


  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isEmpty = false;
  var controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding:  EdgeInsets.only(top: 80.sp,bottom: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('images/Logo-removebg.png')),
                    ),
                  ),
                  SizedBox(height: 40.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                    child: Container(
                      width: double.infinity,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5.r),
                        border: Border.all(
                          color: Color.fromRGBO(217, 219, 221, 1), // Border color
                          width: 1.w,           // Border width
                        ),
                      ),
                      child: TextFormField(
                        controller: phoneController,
                        cursorColor: Colors.grey,
                        keyboardType: TextInputType.phone,
                        onFieldSubmitted: (value){
                          //controller.phoneNum = value!;
                        },
                        validator: (String? value) {
                          if(value!.isEmpty){
                            return '  Please enter your Phone number';
                          };
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'phone',
                          ),
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(130,133,170,1),
                          ),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color.fromRGBO(130,133,170,1),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 80.h,),
                  // Padding(
                  //   padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                  //   child: Container(
                  //     width: double.infinity,
                  //     height: 50.h,
                  //     decoration: BoxDecoration(
                  //       color: Colors.grey.shade300,
                  //       borderRadius: BorderRadius.circular(5.r),
                  //       border: Border.all(
                  //         color: Color.fromRGBO(217, 219, 221, 1), // Border color
                  //         width: 1.w,           // Border width
                  //       ),
                  //     ),
                  //     child: TextFormField(
                  //       controller: emailController,
                  //       cursorColor: Colors.grey,
                  //       keyboardType: TextInputType.emailAddress,
                  //       validator: (String? value) {
                  //         if(value!.isEmpty){
                  //           return '  Please enter your email';
                  //         };
                  //       },
                  //       decoration: InputDecoration(
                  //         border: InputBorder.none,
                  //         label: Text(
                  //           'Email Address',
                  //         ),
                  //         labelStyle: TextStyle(
                  //           color: Color.fromRGBO(130,133,170,1),
                  //         ),
                  //         prefixIcon: Icon(
                  //           Icons.email_outlined,
                  //           color: Color.fromRGBO(130,133,170,1),),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 10.h),
                  // Padding(
                  //   padding:  EdgeInsets.symmetric(horizontal: 20.h),
                  //   child: Container(
                  //     width: double.infinity,
                  //     height: 50.h,
                  //     decoration: BoxDecoration(
                  //       color: Colors.grey.shade300,
                  //       borderRadius: BorderRadius.circular(5.r),
                  //       border: Border.all(
                  //         color: Color.fromRGBO(217, 219, 221, 1), // Border color
                  //         width: 1.w,           // Border width
                  //       ),
                  //     ),
                  //     child: TextFormField(
                  //       controller: passwordController,
                  //       cursorColor: Colors.grey,
                  //       keyboardType: TextInputType.visiblePassword,
                  //       validator: (String? value) {
                  //         if(value!.isEmpty){
                  //           return '   Please enter your password';
                  //         };
                  //       },
                  //       decoration: InputDecoration(
                  //         border: InputBorder.none,
                  //         labelText: 'Password',
                  //         labelStyle: TextStyle(
                  //           color: Color.fromRGBO(130,133,170,1),
                  //         ),
                  //         prefixIcon: Icon(
                  //             LineAwesomeIcons.lock,
                  //           color: Color.fromRGBO(130,133,170,1),),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 80.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                    child: InkWell(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {

                          controller.phoneNum = phoneController.text;
                          //await controller.phoneAuth(phoneNum: controller.phoneNum!);
                          await controller.sendPhone(phoneNumber: phoneController.text);
                          print(phoneController.text);
                          print(controller.phoneNum);

                        }
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
                            'Log In',
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
                  SizedBox(height: 20.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                    child: InkWell(
                      onTap: (){

                      },
                      child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 4), // Offset in the x and y directions
                              blurRadius: 6.0,
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 40.w,
                                height: 40.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage('images/google.png')),
                                ),
                              ),
                              SizedBox(width: 5.w,),
                              Text(
                                'Continue with google',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                    child: InkWell(
                      onTap: (){

                      },
                      child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 4), // Offset in the x and y directions
                              blurRadius: 6.0,
                            ),
                          ],
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 25.w,
                                height: 25.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: AssetImage('images/apple.png')),
                                ),
                              ),
                              SizedBox(width: 8.w,),
                              Text(
                                'Sign In with Apple ID',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                    child: InkWell(
                      onTap: (){

                      },
                      child: Container(
                        width: double.infinity,
                        height: 50.h,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 4), // Offset in the x and y directions
                              blurRadius: 6.0,
                            ),
                          ],
                          color: Color.fromRGBO(57,87,154,1),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 30.w,
                                height: 30.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(fit: BoxFit.cover,image: AssetImage('images/Facebook_icon_2013.svg.png')),
                                ),
                              ),
                              SizedBox(width: 8.w,),
                              Text(
                                'Continue with Facebook',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w500
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 3.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account ?',
                        style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500
                        ),
                      ),

                      TextButton(
                          onPressed: (){
                            Get.off(SignUpScreen());
                          },
                          child: Text('SignUp',style: TextStyle(color: Color.fromRGBO(46,50,141,1) ),)
                      )

                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
