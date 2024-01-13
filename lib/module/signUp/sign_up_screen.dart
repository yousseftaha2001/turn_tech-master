import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:turn_tech/module/login/login_screen.dart';
import 'package:turn_tech/module/signUp/sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isEmpty = false ;
  var controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding:  EdgeInsets.only(top: 80.h,bottom: 20.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 150.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage('images/Logo.jpg')),
                    ),
                  ),
                  SizedBox(height: 40.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.h),
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
                        controller: emailController,
                        cursorColor: Colors.grey,
                        keyboardType: TextInputType.emailAddress,
                        validator: (String? value) {
                          if(value!.isEmpty){
                            return '  Please enter your email';
                          };
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text(
                            'Email Address',
                          ),
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(130,133,170,1),
                          ),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Color.fromRGBO(130,133,170,1),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.h),
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
                        controller: passwordController,
                        cursorColor: Colors.grey,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (String? value) {
                          if(value!.isEmpty){
                            return '   Please enter your password';
                          };
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(130,133,170,1),
                          ),
                          prefixIcon: Icon(
                            LineAwesomeIcons.lock,
                            color: Color.fromRGBO(130,133,170,1),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.h),
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
                        controller: confirmPasswordController,
                        cursorColor: Colors.grey,
                        keyboardType: TextInputType.visiblePassword,
                        validator: (String? value) {
                          if(value!.isEmpty){
                            return '   Please enter your password first ';
                          };
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(130,133,170,1),
                          ),
                          prefixIcon: Icon(
                            LineAwesomeIcons.lock,
                            color: Color.fromRGBO(130,133,170,1),),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),

                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.h),
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
                        keyboardType: TextInputType.number,
                        validator: (String? value) {
                          if(value!.isEmpty){
                            return '   Please enter your phone number';
                          };
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          labelText: 'Phone',
                          labelStyle: TextStyle(
                            color: Color.fromRGBO(130,133,170,1),
                          ),
                          prefixIcon: Icon(
                            LineAwesomeIcons.phone,
                            color: Color.fromRGBO(130,133,170,1),),
                        ),
                      ),
                    ),
                  ),



                  SizedBox(height: 80.h),



                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.sp),
                    child: InkWell(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                         if(passwordController.text == confirmPasswordController.text)
                           {
                             await controller.signUp(email: emailController.text, password: passwordController.text, phone: phoneController.text);
                             Get.off(LoginScreen());
                           }else{
                           print('conflict in password');
                         }
                        }
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
                          color: Color.fromRGBO(46,50,141,1),
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Center(
                          child: Text(
                            'Sign Up',
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


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account !',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      TextButton(
                          onPressed: (){
                            Get.off(LoginScreen());
                          },
                          child: Text('Login',style: TextStyle(color: Color.fromRGBO(46,50,141,1) ),)
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
