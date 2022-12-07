import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/features/onboarding/presenttion/controllers/onboarding_controller.dart';
import 'package:loan_app/core/colors/app_colors.dart';
import 'package:loan_app/core/routes/routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/network/cache_helper.dart';
import '../../../../core/widgets/shared_widgets.dart';
import '../../../../core/app_texts/app_texts.dart';
import '../widgets/onboarding_widget.dart';

class OnBoarding_Screen extends StatelessWidget {
  OnBoarding_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void submit() {
      SharedPrefs.saveData(key: 'onBoarding', value: true).then(((value) {
        if (value = true) {
          Get.offAndToNamed(RoutesClass.getLoginRoute());

        }
      }));
    }

    return GetBuilder<OnBoardingController>(
        init: OnBoardingController(),
        builder: ((onboardingcontroller) => Scaffold(
              backgroundColor: AppColors.primaryColor,
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: AppColors.primaryColor,
                actions: [
                  TextButton(
                      onPressed: () {
                        Get.toNamed(RoutesClass.getLoginRoute());
                        submit();
                      },
                      child: Text(
                          AppTexts.skip.tr,
                        style:  context.theme.textTheme.headline2?.copyWith(
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
                              OnBoardingItem(onboardingcontroller.board[index]),
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
                                activeDotColor: AppColors.primaryColor,
                                dotHeight: 10.h,
                                dotWidth: 10.w,
                                spacing: 11.w),
                          )
                        : Padding(
                            padding:
                                 EdgeInsets.symmetric(horizontal: 20.0.w),
                            child:
                            MaterialButton(
    onPressed: (){
      submit();
      Get.offAllNamed(RoutesClass.getLoginRoute());
    },
    color: AppColors.primaryColor,
    child: Text(AppTexts.get_started.tr),
    )
                            /*DefaultButton(text: AppTexts.get_started.tr,
                                screen: RoutesClass.getLoginRoute()),*/
                          ),
                  )
                ],
              ),
            )));
  }
}

