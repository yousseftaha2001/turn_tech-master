import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SignUpController extends GetxController{


  // final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp({required String email,required String password,required String phone}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      print('User signed up successfully!');
    } catch (e) {
      print(e.toString());
    }
  }

}