import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_cart/common/buttons/app_primary_button.dart';
import 'package:shop_cart/constants/app_colors.dart';
import 'package:shop_cart/constants/app_images.dart';
import 'package:shop_cart/modules/auth_module/controller/auth_controller.dart';
import 'package:shop_cart/modules/auth_module/views/login_view.dart';
import 'package:shop_cart/modules/onboarding/widgets/custom_text.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<AuthController>();

    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    var formKey = GlobalKey<FormState>();
    // final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: PrimaryColor,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Image.asset(
                  AppImages.logo_img,
                  width: 130,
                  height: 130,
                  fit: BoxFit.cover,
                ),
                const CustomText(
                  text: 'FoodNinja',
                  fontFamily: 'Bold',
                  color: Colors.green,
                  fontsize: 30,
                ),
                const CustomText(
                  text: 'Deliver Favorite Food',
                  fontFamily: 'Light',
                  color: Colors.white,
                  fontsize: 16,
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(
                  text: 'Sign Up For Free',
                  color: Colors.white,
                  fontFamily: 'Light',
                  fontsize: 30,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter user name";
                      } else {
                        return null;
                      }
                    },
                    controller: usernameController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "User name",
                        filled: true,
                        fillColor: textFieldColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter email";
                      } else if (value.isEmail == false) {  //also write (!value.isEmail)
                        return "Enter valid Email id ";
                      } else {
                        return null;
                      }
                    },
                    controller: emailController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Email",
                        filled: true,
                        fillColor: textFieldColor,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Obx(
                  () => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter password";
                      } else if (value.length < 8) {  
                        return "Enter a Strong Password ";
                      } else {
                        return null;
                      }
                    },
                      controller: passwordController,
                      style: const TextStyle(color: Colors.white),
                      obscureText: loginController.ispasswordVisible.value,
                      decoration: InputDecoration(
                          hintText: "Password",
                          filled: true,
                          fillColor: textFieldColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          suffixIcon: IconButton(
                              onPressed: () {
                                loginController.ispasswordVisible(
                                    !loginController.ispasswordVisible.value);
                              },
                              icon: Icon(
                                  loginController.ispasswordVisible.isTrue
                                      ? Icons.visibility
                                      : Icons.visibility_off))),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: InkWell(
                          onTap: () {
                            loginController.isKeepMeSignInEnabled(
                                !loginController.isKeepMeSignInEnabled.value);
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                border: Border.all(color: greenColor),
                                color:
                                    loginController.isKeepMeSignInEnabled.isTrue
                                        ? greenColor
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(30)),
                            child: loginController.isKeepMeSignInEnabled.isTrue
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )
                                : Container(),
                          ),
                        ),
                      ),
                    ),
                    const CustomText(
                      text: "Keep me sign in",
                      color: Colors.white,
                      fontFamily: 'Regular',
                      fontsize: 16,
                    )
                  ],
                ),
                Row(
                  children: [
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        child: InkWell(
                          onTap: () {
                            loginController.isEmailAbountPricing(
                                !loginController.isEmailAbountPricing.value);
                          },
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                border: Border.all(color: greenColor),
                                color:
                                    loginController.isEmailAbountPricing.isTrue
                                        ? greenColor
                                        : Colors.transparent,
                                borderRadius: BorderRadius.circular(30)),
                            child: loginController.isEmailAbountPricing.isTrue
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  )
                                : Container(),
                          ),
                        ),
                      ),
                    ),
                    const CustomText(
                      text: "Email Me abount special pricing",
                      color: Colors.white,
                      fontFamily: 'Regular',
                      fontsize: 16,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          height: 120,
          child: Column(
            children: [
              Obx(()=>
                AppPrimaryButton(
                  isLoading: loginController.isLoading.isTrue,
                  buttonText: "Create Account",
                  onTap: () {
                    // create account function
                
                    if (formKey.currentState!.validate()) {
                      loginController.createAccount(
                          email: emailController.text,
                          password: passwordController.text,
                          username: usernameController.text);
                    } else {
                      log("Fill All the Fields");
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(const LoginView());
                  },
                  child: const CustomText(
                    text: 'Already have an account?',
                    color: greenColor,
                    fontFamily: 'Regular',
                    fontsize: 16,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
