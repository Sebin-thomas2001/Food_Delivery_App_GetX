import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_cart/common/buttons/app_primary_button.dart';
import 'package:shop_cart/constants/app_colors.dart';
import 'package:shop_cart/constants/app_images.dart';
import 'package:shop_cart/modules/auth_module/controller/auth_controller.dart';
import 'package:shop_cart/modules/auth_module/views/sign_up_view.dart';
import 'package:shop_cart/modules/onboarding/widgets/custom_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final loginController = Get.find<AuthController>();

    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    // final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: PrimaryColor,
      body: Center(
        child: Form(
          key: formKey,
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
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter email";
                    } else if (value.isEmail == false) {
                      //also write (!value.isEmail)
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
                height: 10,
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    controller: passwordController,
                    style: const TextStyle(color: Colors.white),
                    obscureText: loginController.ispasswordVisible.value,
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
                            icon: Icon(loginController.ispasswordVisible.isTrue
                                ? Icons.visibility
                                : Icons.visibility_off))),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Container(
          height: 120,
          child: Column(
            children: [
              Obx(
                () => AppPrimaryButton(
                  buttonText: "Login",
                  isLoading: loginController.isLoading.isTrue,
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      loginController.userLogin(
                          email: emailController.text,
                          password: passwordController.text);
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                  onPressed: () {
                    Get.to(const SignUpView());
                  },
                  child: const CustomText(
                    text: 'or Register Now',
                    color: greenColor,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
