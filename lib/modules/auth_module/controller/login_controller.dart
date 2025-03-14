import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  RxBool ispasswordVisible = false.obs;

  RxBool isKeepMeSignInEnabled = true.obs;
  RxBool isEmailAbountPricing = true.obs;

  Future<void> createAccount({
    required String email,
    required String password,
    required String username,
  }) async {
    try {
      // Create user with email and password
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Check if the account creation was successful
      if (credential.user != null) {
        log("User Created: ${credential.user!.uid}");
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuthException codes
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        log('The email provided is not valid.');
      } else {
        // Log other FirebaseAuthExceptions that are not specifically handled
        log('Firebase Auth Error: ${e.code} - ${e.message}');
      }
    } catch (e) {
      // Log any other exceptions that are not FirebaseAuthException
      log('Error creating account: ${e.toString()}');
    }
  }
}
