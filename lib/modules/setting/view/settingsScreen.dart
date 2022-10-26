import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/setting/models/setting_model.dart';
import 'package:loan_app/modules/setting/widget/setting_widget.dart';
import 'package:loan_app/resources/app_images/app_images.dart';
import 'package:loan_app/resources/app_texts/app_texts.dart';
import 'package:loan_app/resources/colors/app_colors.dart';
import '../controller/setting_controller.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingsController>(
      init: SettingsController(),

      builder: (settingcontroller)=>SafeArea(
          top: true,
          minimum: EdgeInsets.only(top: 30.h),
          child: Column(
            children: [
             
              Expanded(
                  child: Container(
             
                padding: EdgeInsets.all(20.h.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(55)),
                    color:Get.isDarkMode?AppColors.primaryTextColor:Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                 Image.asset(AppImages.profile,width: 154.w,height: 154.h,fit: BoxFit.cover,),
                    Text(AppTexts.username.tr,style: TextStyle(
                   color: AppColors.primaryTextColor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700
                    ),),
                    SizedBox(
                      height: 15.h,
                    ),
                  Expanded(child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 15.h,),
                    itemBuilder: ((context, index) =>  SettingCard(SettingModel(
cardIcon: settingcontroller.cardIcons[index],
title: settingcontroller.cardTitle[index],
screen: settingcontroller.cardScreens[index]
                    
                    ))),
                   itemCount: settingcontroller.cardIcons.length,
                   ),
                   )
                  ],
                ),
              )),
            ],
          ),
        ),
      
    );
  }
}
