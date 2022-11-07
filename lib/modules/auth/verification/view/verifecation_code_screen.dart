import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loan_app/modules/auth/login/controller/login_controller.dart';
import 'package:loan_app/resources/app_sizes/app_sizes.dart';
import '../../../../resources/widgets/shared_widgets.dart';
import 'package:loan_app/resources/colors/app_colors.dart';
import 'package:loan_app/resources/routes/routes.dart';

import '../../../../resources/app_texts/app_texts.dart';


class VerificationScreen extends StatelessWidget {
String phone;
VerificationScreen(this.phone);
LogInController verificationController=Get.find();
  @override
  Widget build(BuildContext context) {
    return
   Scaffold(
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
                        child:
                        OtpTextField(
                          numberOfFields: 4,
                          fillColor: AppColors.primaryColor,
                          showFieldAsBox: true,
                          /*onSubmit: (String verificationCode){
                            showDialog(
                                context: context,
                                builder: (context){
                                  return AlertDialog(
                                    title: Text(AppTexts.verification_code),
                                    content: Text('Code entered is $verificationCode'),
                                  );
                                }
                            );
                          },*/ // end onSubmit
                        ),


                      ),
                      SizedBox(
                        height: AppSizes.sizedBox36.h,
                      ),
                      MaterialButton(onPressed:(){
                         verificationController.verificationCode(
                          phoneNumber: phone,
                           code: verificationController.codeController.text, );
                        Get.toNamed(RoutesClass.getSetupAccountRoute());
                      },padding: EdgeInsets.all(20),
                        color: AppColors.primaryColor,
                        minWidth: double.infinity,
                        child: Text(AppTexts.continuebutton.tr,),),
                      /*DefaultButton( text:AppTexts.continuebutton.tr,
                        screen: RoutesClass.getSetupAccountRoute()),*/
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
