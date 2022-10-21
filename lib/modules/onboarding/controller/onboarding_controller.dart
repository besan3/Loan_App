import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/onboarding_model.dart';

class OnBoardingController extends GetxController{
  var onboardController = PageController();
  bool isLast = false;
  List<OnboardingModel> board = [
      OnboardingModel(
          image: 'assets/images/onboard1.png',
          title: 'Get Access To Quick Loans',
          description: '''Easily get access to loans 
using your phone'''),
      OnboardingModel(
          image: 'assets/images/onboard2.png',
          title: 'Easy & Convenient',
          description: 'No guarantors, No long queues, No paper.'),
      OnboardingModel(
          image:
              'assets/images/onboard3.png',
          title: 'Track Everything',
          description: '''Your financial journey
start here'''),
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