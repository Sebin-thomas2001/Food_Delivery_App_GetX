import 'package:flutter/material.dart';
import 'package:shop_cart/constants/app_colors.dart';

import '../../../constants/app_images.dart';

class CreateBioView extends StatelessWidget {
  const CreateBioView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: PrimaryColor,
      body: Stack(
        children: [
           Image.asset(
                AppImages.backgrounf_img,
                width: size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            
        ],
      ),
    );
  }
}