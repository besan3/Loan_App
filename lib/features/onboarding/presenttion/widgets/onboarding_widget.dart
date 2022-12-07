import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loan_app/core/colors/app_colors.dart';
import '../../data/models/onboarding_model.dart';
class OnBoardingItem extends StatelessWidget {
  OnboardingModel onboardingModel;
  OnBoardingItem(this.onboardingModel);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Image.asset(
            '${onboardingModel.image}',
          ),
        ),
        Container(
          height: 359.h,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(55.r)),
              color:Get.isDarkMode?AppColors.primaryTextColor: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${onboardingModel.title.tr}',
                style: context.theme.textTheme.bodyText1,
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                '${onboardingModel.description.tr}',
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
}

