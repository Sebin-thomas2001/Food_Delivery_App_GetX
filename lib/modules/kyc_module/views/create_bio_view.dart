
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_cart/constants/app_colors.dart';
import 'package:shop_cart/modules/kyc_module/views/upload_your_photo.dart';
import 'package:shop_cart/modules/onboarding/widgets/custom_text.dart';

import '../../../common/buttons/app_primary_button.dart';


class CreateBioView extends StatefulWidget {
  CreateBioView({super.key});

  @override
  State<CreateBioView> createState() => _CreateBioViewState();
}

class _CreateBioViewState extends State<CreateBioView> {
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController mobileController = TextEditingController();

    return Scaffold(
        backgroundColor: PrimaryColor,
        body: Form(
          key: formKey,
          child: Column(
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
                  child: const Icon(CupertinoIcons.back,
                      color: backArrowIconColor),
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
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: firstNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                        return "Please enter First Name";
                      } else {
                        return null;
                      }
                  },
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
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: lastNameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                        return "Please enter Last Name";
                      } else {
                        return null;
                      }
                  },
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
                child: TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: mobileController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                        return "Please enter Mobile Number";
                      } else if(value.length != 10) {
                         return "Please enter a Valid Number";
                        
                      }else{
                        return null;
                      }
                  },
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
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Container(
            child: AppPrimaryButton(
              buttonText: "Next",
              onTap: () {
                if(formKey.currentState!.validate())
                Get.to(() => UploadYourPhoto());
              },
            ),
          ),
        ));
  }
}
