import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../shared/colors/app_colors.dart';
import '../models/onboarding_model.dart';
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
              color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${onboardingModel.title}',
                style: TextStyle(
                    color: AppColors.primaryTextColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20.sp,
                    fontFamily: 'Poppins'),
              ),
              SizedBox(
                height: 14.h,
              ),
              Text(
                '${onboardingModel.description}',
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

