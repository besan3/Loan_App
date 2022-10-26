import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loan_app/resources/app_sizes/app_sizes.dart';
import '../../../../resources/widgets/shared_widgets.dart';
import 'package:loan_app/resources/colors/app_colors.dart';
import 'package:loan_app/resources/routes/routes.dart';

import '../../../../resources/app_texts/app_texts.dart';


class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(

        toolbarHeight: 60.h,
        title: Text(AppTexts.verification_code.tr),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: AppSizes.padding20.h),
                padding: EdgeInsets.all(AppSizes.padding20.h.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(AppSizes.radius55.r)),
                    color:Get.isDarkMode?AppColors.primaryTextColor: AppColors.backgroundColor
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: AppSizes.sizedBox36.w),
                      child: Text(
                        AppTexts.verification.tr,
                        style:  context.theme.textTheme.bodyText1?.copyWith(
                          fontWeight:FontWeight. w400
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: AppSizes.sizedBox30.w, ),
                      child: Container(
                        height: 64.h,

                        width: double.infinity,
                        child: GridView.count(
                            crossAxisCount: 4,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisSpacing: AppSizes.padding20.w,
                            children: List.generate(
                                4,
                                (index) => DefaultCard(width:64.w, text:'6',
                                 radius: AppSizes.radius15.r))),
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.sizedBox36.h,
                    ),
                    DefaultButton( text:AppTexts.continuebutton.tr,
                      screen: RoutesClass.getSetupAccountRoute()),
                    SizedBox(
                      height: 29.h,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: AppTexts.not_received.tr,
                          style: context.theme.textTheme.subtitle1),
                      TextSpan(
                          text: AppTexts.resend.tr,
                          style: context.theme.textTheme.subtitle1?.copyWith(
                            color: AppColors.primaryColor
                          ))
                    ]))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
