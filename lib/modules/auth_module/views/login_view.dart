import 'package:flutter/material.dart';
import 'package:shop_cart/constants/app_colors.dart';
import 'package:shop_cart/constants/app_images.dart';
import 'package:shop_cart/modules/onboarding/views/onboarding_view_1.dart';
import 'package:shop_cart/modules/onboarding/widgets/custom_text.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {


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
