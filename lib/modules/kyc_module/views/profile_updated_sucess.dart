import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_cart/constants/app_colors.dart';
import 'package:shop_cart/constants/app_images.dart';
import 'package:shop_cart/modules/auth_module/controller/auth_controller.dart';
import 'package:shop_cart/modules/onboarding/widgets/custom_text.dart';

import '../../../common/buttons/app_primary_button.dart';

class ProfileUpdatedSucess extends StatefulWidget {
  const ProfileUpdatedSucess({super.key});

  @override
  State<ProfileUpdatedSucess> createState() => _ProfileUpdatedSucessState();
}

class _ProfileUpdatedSucessState extends State<ProfileUpdatedSucess> {
  @override
  // void initState() {
  //   super.initState();
  //   redirectToNextScreen();
  // }

  // redirectToNextScreen() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   Get.find<AuthController>().checkForLogin();  // check user is logged or not
  //   // Navigator.pushReplacement(
  //   //   context,
  //   //   MaterialPageRoute(
  //   //     builder: (context) => const OnboardingView1(),
  //   //   ),
  //   // );
  // }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: PrimaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              
              Image.asset(
                AppImages.check_img,
                width: 150,
                height: 150,
                fit: BoxFit.cover,
              ),
              const CustomText(
                text: 'Congrats',
                fontFamily: 'Bold',
                color: Colors.green,
                fontsize: 55,
              ),
              const CustomText(
                text: 'Your Profile Ready to Use',
                fontFamily: 'Light',
                color: Colors.white,
                fontsize: 20,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: Container(
            child: AppPrimaryButton(
              buttonText: "Try Order",
              
              onTap: () {
                // if (kycController.locationName != "null") {
                //   Get.to(() => ProfileUpdatedSucess());
                // } else {
                //   Get.snackbar(
                //     "Add Location to continue ",
                //     "Try again",
                //     colorText: white,
                //     backgroundColor: Red,
                //     snackPosition: SnackPosition.BOTTOM,
                //   );
                // }
              },
            ),
          ),
        )
        );
  }
}
