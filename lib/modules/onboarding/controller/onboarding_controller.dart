import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/resources/app_images/app_images.dart';

import '../../../resources/app_texts/app_texts.dart';
import '../models/onboarding_model.dart';

class OnBoardingController extends GetxController{
  var onboardController = PageController();
  bool isLast = false;
  List<OnboardingModel> board = [
      OnboardingModel(
          image:AppImages.onboard1,
          title: AppTexts.onboardingTitle1.tr,
          description:AppTexts.description1.tr),
      OnboardingModel(
          image: AppImages.onboard2,
          title: AppTexts.onBoardingTitle2.tr,
          description:AppTexts.description2.tr),
      OnboardingModel(
          image:
              AppImages.onboard3,
          title: AppTexts.onBoardingTitle3.tr,
          description: AppTexts.description3.tr),
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