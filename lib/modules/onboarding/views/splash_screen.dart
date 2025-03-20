import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_cart/constants/app_colors.dart';
import 'package:shop_cart/constants/app_images.dart';
import 'package:shop_cart/modules/auth_module/controller/auth_controller.dart';
import 'package:shop_cart/modules/onboarding/widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    redirectToNextScreen();
  }

  redirectToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.find<AuthController>().checkForLogin();  // check user is logged or not
    // Navigator.pushReplacement(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const OnboardingView1(),
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: PrimaryColor,
        body: Center(
          child: Column(
            children: [
              Image.asset(
                AppImages.backgrounf_img,
                width: size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
              Image.asset(
                AppImages.logo_img,
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
              const CustomText(
                text: 'FoodNinja',
                fontFamily: 'Bold',
                color: Colors.green,
                fontsize: 65,
              ),
              const CustomText(
                text: 'Deliver Favorite Food',
                fontFamily: 'Light',
                color: Colors.white,
                fontsize: 20,
              ),
            ],
          ),
        ));
  }
}
