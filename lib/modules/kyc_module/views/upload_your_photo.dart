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

class UploadYourPhoto extends StatelessWidget {
  UploadYourPhoto({super.key});

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
                  text: 'Upload Your Photo\nProfile',
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
            Center(
              child: Obx(
                () => Container(
                  width: size.width / 1.4,
                  child: kycController.profileImagePath.value != "null"
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Column(
                            children: [
                              Container(
                                width: size.width / 1.1,
                                height: 200,
                                child: kIsWeb
                                    ? Image.network(kycController
                                        .profileImagePath
                                        .value) // Assuming you store the URL
                                    : Image.file(
                                        File(kycController
                                            .profileImagePath.value),
                                        fit: BoxFit.fill), // For mobile
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextButton(
                                  onPressed: () {
                                    kycController.profileImagePath("null");
                                  },
                                  child: const Text(
                                    "Clear Image",
                                    style: TextStyle(color: Colors.amber),
                                  ))
                            ],
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                kycController.takePicture();
                              },
                              child: Container(
                                width: size.width,
                                height: 130,
                                decoration: BoxDecoration(
                                    color: textFieldColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppImages.gallery_img,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    const CustomText(
                                      text: "From Gallery",
                                      fontFamily: 'Regular',
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                kycController.takePicture();
                              },
                              child: Container(
                                width: size.width,
                                height: 130,
                                decoration: BoxDecoration(
                                    color: textFieldColor,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppImages.camera_img,
                                      width: 50,
                                      height: 50,
                                      fit: BoxFit.cover,
                                    ),
                                    const CustomText(
                                      text: "Take Picture",
                                      fontFamily: 'Regular',
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                ),
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
