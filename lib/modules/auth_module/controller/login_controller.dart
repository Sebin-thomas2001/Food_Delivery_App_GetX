import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool ispasswordVisible = false.obs;

  RxBool isKeepMeSignInEnabled = true.obs;
  RxBool isEmailAbountPricing = true.obs;

  createAccount(
      {required String email,
      required String password,
      required String username}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        log("User Crated");
      }

      print(credential.user!.uid);
      } 
      on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      }
    } catch (message) {
      print(message.toString());
    }
  }
}
