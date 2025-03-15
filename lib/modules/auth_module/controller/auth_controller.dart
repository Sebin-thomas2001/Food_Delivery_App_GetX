import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shop_cart/constants/app_colors.dart';
import 'package:shop_cart/modules/auth_module/views/login_view.dart';
import 'package:shop_cart/modules/kyc_module/views/create_bio_view.dart';
import 'package:shop_cart/modules/onboarding/views/onboarding_view_1.dart';

class AuthController extends GetxController {
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
      isLoading(false);
      // Handle specific FirebaseAuthException codes
      if (e.code == 'weak-password') {
        log('The password provided is too weak.');
        Get.snackbar(
          "weak-password",
          'Enter Strong Password.',
          colorText: white,
          backgroundColor: Red,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'Email already in use') {
        log('The account already exists for that email.');
        Get.snackbar(
          'Email already in use',
          'The account already exists for that email.',
          colorText: white,
          backgroundColor: Red,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'invalid email') {
        log('The email provided is not valid.');
      } else {
        // Log other FirebaseAuthExceptions that are not specifically handled
        log('Firebase Auth Error: ${e.code} - ${e.message}');
      }
    } catch (e) {
      isLoading(false);
      // Log any other exceptions that are not FirebaseAuthException
      log('Error creating account: ${e.toString()}');
    }
  }

  userLogin({required String email, required String password}) async {
    isLoading(false);
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      isLoading(false);
      if (credential.user != null) {
        log("User Logged in: ${credential.user!.uid}");
        Get.off(CreateBioView());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
        Get.snackbar(
          'User not found',
          'No user found for that email.',
          colorText: white,
          backgroundColor: Red,
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
        Get.snackbar(
          'Wrong password',
          'Wrong password provided for that user.',
          colorText: white,
          backgroundColor: Red,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }

  checkForLogin() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        log(user.uid);

        ///kyc or Home
        Get.offAll(CreateBioView());
      } else {
        //loginScreen
        Get.offAll(OnboardingView1());
      }
    });
  }
}
