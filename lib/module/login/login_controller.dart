import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turn_tech/module/Layout/layout.dart';
import 'package:turn_tech/module/login/login_screen.dart';
import 'package:turn_tech/module/login/state.dart';

import '../OTP/otp_screen.dart';


class LoginController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    state.phone=TextEditingController();
    state.code=TextEditingController();
  }


  final LoginState state = LoginState();

  FirebaseAuth auth = FirebaseAuth.instance;
  String? verfiId;
  String? phoneNum;
  // var c1 = TextEditingController();
  Future<void> login({required String email,required String password }) async {
    try {
     var w = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email , password: password);
     print(w);
      print('right');
      Get.off(Layout());
    } catch (e) {
      print('wrong');
      print(e.toString());
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("User signed out");
    } catch (e) {
      print("Error signing out: $e");
    }
  }




  Future sendPhone({required String phoneNumber})async{
    if(phoneNumber.isNotEmpty){
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '${phoneNumber}',
        verificationCompleted: (PhoneAuthCredential credential) {
          print('code sent');
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.toString());
        },
        codeSent: (String verificationId, int? resendToken) {
          print('code sent2');

          Get.to(OTPScreen(veryId: verificationId,));
           //Get.dialog(OTPScreen(veryId: verificationId));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    }else{
      Get.snackbar('Error', 'please enter your phone number',backgroundColor: Colors.white);
    }
  }




  Future<void> signInWithPhoneNumber({required String smsCode,required String verificationId}) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      var r = await FirebaseAuth.instance.signInWithCredential(credential);
      print(r.user!.phoneNumber);
      print(r.user!.uid);
      print('Successfully signed in with phone number');
    } catch (e) {
      print('Error signing in with phone number: $e');
    }
  }


  // Future<void> phoneAuth({required  String phoneNum , String? controller })async{
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     phoneNumber: phoneNum,
  //     verificationCompleted: (PhoneAuthCredential credential) {
  //       print('completed');
  //     },
  //     verificationFailed: (FirebaseAuthException e) {},
  //     codeSent: (String verificationId, int? resendToken ) async{
  //       Get.to(OTPScreen());
  //       // print('phone auth function');
  //       // print(verificationId);
  //       print('code sent');
  //       verfiId = verificationId;
  //       print("ver : ${verfiId}");
  //       await sentCode(code: controller!);
  //
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {},
  //   );
  // }
  //
  // sentCode({required String code})async{
  //   try{
  //     String smsCode = code;
  //
  //     // Create a PhoneAuthCredential with the code
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //         verificationId: verfiId!,
  //         smsCode: smsCode,
  //     );
  //
  //     // Sign the user in (or link) with the credential
  //     await auth.signInWithCredential(credential).then((value) {
  //       if(value.user != null )
  //         {
  //           Get.to(Layout());
  //         }
  //     });
  //   }catch(e){
  //     print(verfiId);
  //     print(code);
  //     print("error when sent code error ${e}" );
  //   }
  // }

}