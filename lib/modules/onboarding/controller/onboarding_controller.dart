import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/onboarding_model.dart';

class OnBoardingController extends GetxController{
  var onboardController = PageController();
  bool isLast = false;
  List<OnboardingModel> board = [
      OnboardingModel(
          image: 'assets/images/onboard1.png',
          title: 'onBoardingTitle1'.tr,
          description: 'description1'.tr),
      OnboardingModel(
          image: 'assets/images/onboard2.png',
          title: 'onBoardingTitle2'.tr,
          description: 'description2'.tr),
      OnboardingModel(
          image:
              'assets/images/onboard3.png',
          title: 'onBoardingTitle3'.tr,
          description: 'description3'.tr),
    ];
void  onPageChanged(index) {
                  if (index ==board.length - 1) {
                       isLast = true;
                    update(
                   
                    );
                    print('last');
                  } else {
                       isLast = false;
                   update(

                   );
                    print('not last');
                  }
                }
}