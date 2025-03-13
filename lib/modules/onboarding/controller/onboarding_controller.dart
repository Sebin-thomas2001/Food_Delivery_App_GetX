import 'package:get/get.dart';

import '../../../constants/app_images.dart';
import '../../../models/onboarding_model.dart';

class OnboardingController extends GetxController {
  RxInt index = 0.obs;

  List<OnboardingModel> onboardingItemsList = [
    OnboardingModel(
        image: AppImages.burger_img,
        subTitle: 'Find Your Comfort\nFood Here',
        title: 'Here You can find a chef or dish for every\ntaste and colors.'),
    OnboardingModel(
        image: AppImages.shawarma_img,
        subTitle: 'FoodNinja is Where Your\nComfort Food Lives',
        title: 'Enjoy a fast and smooth food delivery at\nyour doorstep'),
  ];
}
