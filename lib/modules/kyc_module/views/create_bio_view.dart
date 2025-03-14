import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_cart/constants/app_colors.dart';
import 'package:shop_cart/modules/onboarding/widgets/custom_text.dart';

import '../../../common/buttons/app_primary_button.dart';
import '../../../constants/app_images.dart';

class CreateBioView extends StatelessWidget {
  const CreateBioView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: PrimaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 40),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: secondaryButtonColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10)),
                child:
                    const Icon(CupertinoIcons.back, color: backArrowIconColor),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: CustomText(
                  text: 'Fill in your bio to get\nstarted',
                  fontFamily: 'Bold',
                  fontsize: 35,
                  color: greenColor),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 20),
              child: CustomText(
                text:
                    'This data will be displayed in your account\nprofile for security',
                fontFamily: 'Regular',
                fontsize: 20,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "First Name",
                    filled: true,
                    fillColor: textFieldColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Last Name",
                    filled: true,
                    fillColor: textFieldColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    hintText: "Mobile Number",
                    filled: true,
                    fillColor: textFieldColor,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    )),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Container(
            
            child: AppPrimaryButton(
              buttonText: "Login",
            ),
          ),
        ));
  }
}
