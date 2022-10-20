import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/controllers/onboarding_controller.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/shared/components/styles/texts.dart';
import 'package:loan_app/views/login/login_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../models/onboarding_model.dart';
import '../../shared/components/components.dart';
import '../../shared/components/styles/colors.dart';
import '../../shared/network/local/cache_helper.dart';

class OnBoarding_Screen extends StatelessWidget {
  OnBoarding_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void submit() {
      CacheHelper.saveData(key: 'onBoarding', value: true).then(((value) {
        if (value = true) {
          Get.offAndToNamed(RoutesClass.getLoginRoute());

        }
      }));
    }

    return GetBuilder<OnBoardingController>(
        init: OnBoardingController(),
        builder: ((onboardingcontroller) => Scaffold(
              backgroundColor: primaryColor,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: primaryColor,
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.toNamed(RoutesClass.getLoginRoute());
                      },
                      child: Text(
                        'Skip',
                        style: smallTextStyle.copyWith(
                          color: Colors.white
                        )
                      ))
                ],
              ),
              body: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: PageView.builder(
                          physics: BouncingScrollPhysics(),
                          onPageChanged: (index) {
                            onboardingcontroller.onPageChanged(index);
                          },
                          itemBuilder: (context, index) =>
                              onboardingItem(onboardingcontroller.board[index]),
                          itemCount: onboardingcontroller.board.length,
                          controller: onboardingcontroller.onboardController,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:  EdgeInsets.only(bottom: 50.h),
                    child: onboardingcontroller.isLast != true
                        ? SmoothPageIndicator(
                            count: onboardingcontroller.board.length,
                            controller: onboardingcontroller.onboardController,
                            effect: WormEffect(
                                activeDotColor: primaryColor,
                                dotHeight: 10.h,
                                dotWidth: 10.w,
                                spacing: 11.w),
                          )
                        : Padding(
                            padding:
                                 EdgeInsets.symmetric(horizontal: 20.0.w),
                            child: DefaultButton(text: 'Get Started',
                                screen: RoutesClass.getLoginRoute()),
                          ),
                  )
                ],
              ),
            )));
  }
}

Widget onboardingItem(OnboardingModel model) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Expanded(
        child: Image.asset(
          '${model.image}',
        ),
      ),
      Container(
        height: 359.h,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(top: Radius.circular(55.r)),
            color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${model.title}',
              style: TextStyle(
                  color: primaryTextColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20.sp,
                  fontFamily: 'Poppins'),
            ),
            SizedBox(
              height: 14.h,
            ),
            Text(
              '${model.description}',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 18.sp,
                  color: Color(0xffA5A5A5)),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ],
  );
}
