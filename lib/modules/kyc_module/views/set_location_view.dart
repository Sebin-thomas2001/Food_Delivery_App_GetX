import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_cart/constants/app_colors.dart';
import 'package:shop_cart/constants/app_images.dart';
import 'package:shop_cart/modules/kyc_module/controller/kyc_controller.dart';
import 'package:shop_cart/modules/onboarding/widgets/custom_text.dart';

import '../../../common/buttons/app_primary_button.dart';

class SetLocationView extends StatelessWidget {
  SetLocationView({super.key});

  var kycController = Get.find<KycController>();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: PrimaryColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 30),
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
              padding: EdgeInsets.only(left: 20, top: 15),
              child: CustomText(
                  text: 'Set Your Location',
                  fontFamily: 'Bold',
                  fontsize: 35,
                  color: greenColor),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, top: 10),
              child: CustomText(
                text:
                    'This data will be displayed in your account\nprofile for security',
                fontFamily: 'Regular',
                fontsize: 17,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: Center(
                child:GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 150,
                    width: size.width,
                    decoration: BoxDecoration(
                      color: textFieldColor,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Column(
                      
                      children:  [
                        Center(
                          child: Container(
                            
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: Row(
                                children: [
                                  Image.asset(AppImages.location_img,
                                  height: 40,
                                  width: 40,
                                  fit: BoxFit.cover,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  const CustomText(text: "Your Location",
                                  fontsize: 25,
                                  fontFamily: 'Light',
                                  color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                        child: Container(
                          height: 50,
                          width: size.width,
                          decoration: BoxDecoration(
                        color: textFieldColor1,
                        borderRadius: BorderRadius.circular(20)
                        ),
                        child: const Center(
                          child:  CustomText(text: 
                          "Set Location",
                          fontFamily: 'Regular',
                          fontsize: 20,
                          color: Colors.white,
                          ),
                        ),
                        ),
                      )
                      ],
                    ),
                  ),
                ) 
                           
              ),
            )
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            child: AppPrimaryButton(
              buttonText: "Next",
              onTap: () {
                if (kycController.profileImagePath != "null") {
                } else {
                  Get.snackbar("Select Profile image ", "Try again",
                  colorText: white,
                  backgroundColor: Red,
                  snackPosition: SnackPosition.BOTTOM,
                  
                  );
                }
              },
            ),
          ),
        ));
  }
}
