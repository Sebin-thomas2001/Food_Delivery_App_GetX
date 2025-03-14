import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shop_cart/modules/kyc_module/views/create_bio_view.dart';

class LoginController extends GetxController {
  RxBool ispasswordVisible = true.obs;

  RxBool isKeepMeSignInEnabled = true.obs;
  RxBool isEmailAbountPricing = true.obs;

  RxBool isLoading = false.obs;

  Future<void> createAccount({
    required String email,
    required String password,
    required String username,
  }) async {
    isLoading(true);
    try {
      // Create user with email and password
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      isLoading(false);
      // Check if the account creation was successful
      if (credential.user != null) {
        log("User Created: ${credential.user!.uid}");
        Get.off(CreateBioView());
      }
    } on FirebaseAuthException catch (e) {
      // Handle specific FirebaseAuthException codes
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
        Get.snackbar("weak-password", 'Enter Strong Password.');
      } else if (e.code == 'email-already-in-use') {
        log('The account already exists for that email.');
        Get.snackbar('email-already-in-use',
            'The account already exists for that email.');
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
