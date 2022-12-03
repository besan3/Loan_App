import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:loan_app/core/app_images/app_images.dart';
import 'package:loan_app/core/app_sizes/app_sizes.dart';
import 'package:loan_app/core/app_texts/app_texts.dart';
import 'package:loan_app/core/colors/app_colors.dart';
import 'package:loan_app/features/auth/data/datasources/remote_data_sources.dart';
import 'package:loan_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:loan_app/features/auth/domain/usecases/request_code_usecase.dart';
import 'package:loan_app/features/users/presenttion/controller/all_users_states.dart';

import '../controller/login_controller.dart';

class LoginScreen extends GetView<LogInController> {
   LoginScreen({super.key});
GlobalKey formKey=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(AppSizes.padding20.h.w),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: AppSizes.sizedBox36.h),
                      child: Image.asset(
                        AppImages.logo,
                        height: AppSizes.logoSize.h,
                        width: AppSizes.logoSize.w,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSizes.sizedBox36.h,
                  ),
                  Center(
                    child: Text(AppTexts.sign_in.tr,
                        style: context.theme.textTheme.headline1),
                  ),
                  SizedBox(
                    height: AppSizes.sizedBox29.h,
                  ),
                  Text(AppTexts.phone_number.tr,
                      style: context.theme.textTheme.bodyText2),
                  SizedBox(
                    height: AppSizes.sizedBox15.h,
                  ),
                  IntlPhoneField(validator: (phoneNumber){
                    if(phoneNumber!.number.isEmpty){
                      return 'Phone Number is too short';
                    }

                  },
                    controller: controller.phoneController,
                    decoration: InputDecoration(
                      labelText: AppTexts.phone_number.tr,
                      labelStyle: context.theme.textTheme.headline4,
                      hintStyle: context.theme.textTheme.headline4,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(AppSizes.radius10.r),
                        borderSide: BorderSide(
                          color: AppColors.borderSideColor,
                          width: 1.w,
                        ),
                      ),
                    ),
                    dropdownIconPosition: IconPosition.trailing,
                    dropdownTextStyle: context.theme.textTheme.headline4,
                    style: context.theme.textTheme.headline4,
                    flagsButtonPadding:
                        EdgeInsets.symmetric(horizontal: AppSizes.padding20.w),
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                  SizedBox(
                    height: AppSizes.sizedBox30.h,
                  ),
                  MaterialButton(
                    onPressed: () {

  controller.requestLoginCode(
    phoneNumber: controller.phoneController.text,
  );


                    },
                    padding: EdgeInsets.all(20),
                    color: AppColors.primaryColor,
                    minWidth: double.infinity,
                    child:
                 GetBuilder<LogInController>(
                   builder: (controller) {
                     switch(controller.isLoading)
                     {
                       case true:
                         return const Center(child: CircularProgressIndicator());

                       default:
                         return Text(
                           AppTexts.continuebutton.tr,
                         );

                     }

                   }
                 )




                  ),

                ],
              ),
            ),
          ),
        ),

    );
  }
}
