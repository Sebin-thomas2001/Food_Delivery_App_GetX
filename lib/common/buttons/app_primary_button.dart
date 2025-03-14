import 'package:flutter/material.dart';
import 'package:shop_cart/modules/onboarding/widgets/custom_text.dart';

import '../../constants/app_colors.dart';

class AppPrimaryButton extends StatelessWidget {
  final String buttonText;
  Function()? onTap;
  bool isLoading;

  AppPrimaryButton({super.key, required this.buttonText, this.onTap,this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          width: size.width,
          height: 60,
          decoration: BoxDecoration(
              gradient:
                  const LinearGradient(colors: [greenColor, lightgreenColor]),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: isLoading ? CircularProgressIndicator() : CustomText(
              text: buttonText,
              lineSpacing: 1,
              fontFamily: 'Bold',
              fontsize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
