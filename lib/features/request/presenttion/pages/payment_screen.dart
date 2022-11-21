import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/features/request/presenttion/controller/request_controller.dart';
import 'package:loan_app/core/app_sizes/app_sizes.dart';
import 'package:loan_app/core/colors/app_colors.dart';
import '../../../../core/widgets/shared_widgets.dart';

import '../../../../core/app_texts/app_texts.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestController>(
        init: RequestController(),
        builder: (requestcontroller) => Scaffold(
              backgroundColor: AppColors.primaryColor,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: AppColors.primaryColor,
                title: Text(AppTexts.request.tr),
              ),
              body: SafeArea(
                  top: true,
                  minimum: EdgeInsets.only(top: AppSizes.padding30.h),
                  child: Column(children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(AppSizes.padding20.h.w),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(AppSizes.radius55.r)),
                            color: Get.isDarkMode
                                ? AppColors.primaryTextColor
                                : Colors.white),
                        child: Padding(
                          padding: EdgeInsets.all(AppSizes.padding20.h.w),
                          child: SingleChildScrollView(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: AppSizes.sizedBox30.h,
                                  ),
                                  Text(AppTexts.phone_number.tr,
                                      style: context.theme.textTheme.headline3),
                                  SizedBox(
                                    height: AppSizes.sizedBox10.h,
                                  ),
                                  DefaultTextForm(
                                      textEditingController:
                                          requestcontroller.phoneNumber,
                                      textInputType: TextInputType.phone,
                                      validator: (value) => 'Uncorrect Name',
                                      label: AppTexts.enter_phone.tr),
                                  SizedBox(
                                    height: AppSizes.sizedBox15.h,
                                  ),

                                  Text(AppTexts.amount.tr,
                                      style: context.theme.textTheme.headline3),
                                  SizedBox(
                                    height: AppSizes.sizedBox10.h,
                                  ),
                                  DefaultTextForm(
                                      textEditingController:
                                          requestcontroller.amount,
                                      textInputType: TextInputType.text,
                                      validator: (value) => 'Uncorrect Name',
                                      label: '1.200',
                                      hasPrefixIcon: true,
                                      iconData: Icons.monetization_on_outlined),
                                  SizedBox(
                                    height: AppSizes.sizedBox15.h,
                                  ),
                                  Text(AppTexts.note.tr,
                                      style: context.theme.textTheme.headline3),
                                  SizedBox(
                                    height: AppSizes.sizedBox10.h,
                                  ),
                                  DefaultTextForm(
                                      textEditingController:
                                          requestcontroller.note,
                                      textInputType: TextInputType.text,
                                      validator: (value) => 'Uncorrect Name',
                                      label: AppTexts.note.tr,
                                      hasPrefixIcon: true,
                                      iconData: Icons.note_outlined),
                                  SizedBox(
                                    height: AppSizes.sizedBox40.h,
                                  ),
                                  MaterialButton(
                                    color: AppColors.primaryColor,
                                    onPressed: () {
                                      requestcontroller.pay(
                                          phoneNumber: requestcontroller
                                              .phoneNumber.text,
                                          amount: requestcontroller.amount.text,
                                          note: requestcontroller.note.text);
                                    },
                                    child: Text(AppTexts.confirm.tr),
                                  )
/*
                                                         DefaultButton( text:AppTexts.confirm.tr,screen: RoutesClass.getProfileRoute())
*/
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ])),
            ));
  }
}