import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/shared/widgets/shared_widgets.dart';

import '../../../../shared/colors/app_colors.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppColors.primaryColor,
        toolbarHeight: 60.h,
        title: Text('screentitle1'.tr),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 20.h),
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(55)),
                    color: AppColors.backgroundColor
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 36.w),
                      child: Text(
                        'verification'.tr,
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30.w, ),
                      child: Container(
                        height: 64.h,

                        width: double.infinity,
                        child: GridView.count(
                            crossAxisCount: 4,
                            physics: NeverScrollableScrollPhysics(),
                            crossAxisSpacing: 20.w,
                            children: List.generate(
                                4,
                                (index) => DefaultCard(width:64.w, text:'6',
                                 radius: 15.r))),
                      ),
                    ),
                    SizedBox(
                      height: 34.h,
                    ),
                    DefaultButton( text:'button2'.tr,
                      screen: RoutesClass.getSetupAccountRoute()),
                    SizedBox(
                      height: 29.h,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'verificationhint'.tr,
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                             color: Get.isDarkMode?Colors.white:AppColors.primaryTextColor
                              )),
                      TextSpan(
                          text: 'resend'.tr,
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: AppColors.primaryColor))
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
