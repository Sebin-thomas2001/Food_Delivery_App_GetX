import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_cart/common/buttons/app_primary_button.dart';
import 'package:shop_cart/constants/app_images.dart';
import 'package:shop_cart/modules/auth_module/views/login_view.dart';
import 'package:shop_cart/modules/onboarding/controller/onboarding_controller.dart';
import 'package:shop_cart/modules/onboarding/widgets/custom_text.dart';

import '../../../constants/app_colors.dart';

class OnboardingView1 extends StatefulWidget {
  const OnboardingView1({super.key});

  @override
  State<OnboardingView1> createState() => _OnboardingView1State();
}

class _OnboardingView1State extends State<OnboardingView1> {
  var onboardingController = Get.find<OnboardingController>();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: PrimaryColor,
      body: Center(
        child: Obx(
          () => Column(
            children: [
              const SizedBox(
                height: 150,
              ),
              Image.asset(
                onboardingController
                    .onboardingItemsList[onboardingController.index.value]
                    .image,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              CustomText(
                textAlign: TextAlign.center,
                text: onboardingController
                    .onboardingItemsList[onboardingController.index.value]
                    .subTitle,
                fontFamily: 'Light',
                fontsize: 25,
                color: Colors.white,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomText(
                text: onboardingController
                    .onboardingItemsList[onboardingController.index.value]
                    .title,
                textAlign: TextAlign.center,
                fontsize: 18,
                color: Colors.amber,
                fontFamily: 'Regular',
              ),
              const SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child:  AppPrimaryButton(
                  buttonText: 'Next',
                  onTap: (){
                    int tempIndex = onboardingController.index.value;

                    if (tempIndex ==
                        onboardingController.onboardingItemsList.length - 1) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginView()));
                    } else {
                      onboardingController.index(tempIndex + 1);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
