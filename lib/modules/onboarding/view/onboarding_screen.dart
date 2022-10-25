import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/onboarding/controller/onboarding_controller.dart';
import 'package:loan_app/modules/onboarding/widget/onboarding_widget.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../shared/colors/app_colors.dart';
import 'package:loan_app/shared/widgets/shared_widgets.dart';
import '../../../shared/network/local/cache_helper.dart';

class OnBoarding_Screen extends StatelessWidget {
  OnBoarding_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   /* void submit() {
      SharedPrefs.saveData(key: 'onBoarding', value: true).then(((value) {
        if (value = true) {
          Get.offAndToNamed(RoutesClass.getLoginRoute());

        }
      }));
    }*/

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
                        //submit();
                      },
                      child: Text(
                        'skip'.tr,
                        style:  Theme.of(context).textTheme.bodyText2?.copyWith(
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
                            child: DefaultButton(text: 'button1'.tr,
                                screen: RoutesClass.getLoginRoute()),
                          ),
                  )
                ],
              ),
            )));
  }
}

