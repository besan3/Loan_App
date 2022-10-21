import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/shared/components/components.dart';
import 'package:loan_app/shared/components/styles/colors.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: primaryColor,
        toolbarHeight: 60.h,
        title: Text('Verification Code'),
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
                    color: backgroundColor
                    ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:  EdgeInsets.symmetric(vertical: 36.w),
                      child: Text(
                        'We sent OTP code to verify your number',
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
                    DefaultButton( text:'Continue',
                      screen: RoutesClass.getSetupAccountRoute()),
                    SizedBox(
                      height: 29.h,
                    ),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: 'Not received code? ',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                             color: Get.isDarkMode?Colors.white:primaryTextColor
                              )),
                      TextSpan(
                          text: 'Resend',
                          style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: primaryColor))
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
