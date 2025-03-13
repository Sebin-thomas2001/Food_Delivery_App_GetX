import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_cart/common/buttons/app_primary_button.dart';
import 'package:shop_cart/constants/app_colors.dart';
import 'package:shop_cart/constants/app_images.dart';
import 'package:shop_cart/modules/auth_module/controller/login_controller.dart';
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
    final loginController = Get.find<LoginController>();
    // final Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: PrimaryColor,
        body: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Image.asset(
                AppImages.logo_img,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              const CustomText(
                text: 'FoodNinja',
                fontFamily: 'Bold',
                color: Colors.green,
                fontsize: 40,
              ),
              const CustomText(
                text: 'Deliver Favorite Food',
                fontFamily: 'Light',
                color: Colors.white,
                fontsize: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
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
                height: 10,
              ),
              Obx(()=> Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
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
                            icon: Icon(loginController.ispasswordVisible.isTrue ? Icons.visibility : Icons.visibility_off))),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            
              
            ],
          ),
          
        ),
        bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          height: 120,
          child: Column(
            children: [
              AppPrimaryButton(
                buttonText: "Create Account",
              ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(const LoginView());
                  },
                  child: const CustomText(
                    text: 'Already have an account?',
                    color: greenColor,
                  ))
            ],
          ),
        ),
      ),
        );
  }
}
