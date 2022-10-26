import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/profile/setting/controller/setting_controller.dart';
import 'package:loan_app/resources/app_sizes/app_sizes.dart';
import 'package:loan_app/resources/colors/app_colors.dart';
import 'package:loan_app/resources/routes/routes.dart';

import '../../../../resources/app_texts/app_texts.dart';


class ProfileSettingScreen extends StatefulWidget {
  ProfileSettingScreen({super.key});
  

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {


  @override
  Widget build(BuildContext context) {
    SettingController settingController=Get.find();
    return Scaffold(
        backgroundColor:  AppColors.primaryColor,
        appBar: AppBar(

          title: Text(AppTexts.setting.tr),

        ),
        body: SafeArea(
          top: true,
          minimum: EdgeInsets.only(top: 30.h),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(AppSizes.padding20.h.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(AppSizes.radius55.r)),
                    color:Get.isDarkMode?AppColors.primaryTextColor:  AppColors.backgroundColor),
                child: GetBuilder<SettingController>(
                 // init: SettingController(),
                  builder:(settingController)=> Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: AppSizes.sizedBox15.h,
                      ),
                      InkWell(
                        onTap: () => settingController.showBottomSheet(),
                        child: ListTile(
                          leading: CircleAvatar(
                              child: Icon(Icons.brightness_4_outlined),
                              radius: 40.r,
                              backgroundColor: AppColors.circleBackgroundColor),
                          title: Text(AppTexts.theme.tr,
                              style:context.theme.textTheme.bodyText1
                          ),
                          subtitle: Text(
                          settingController.  theme.name,
                            style:context.theme.textTheme.headline2?.copyWith(

                                fontSize: 16.sp),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => settingController.showLangBottomSheet(),
                        child: ListTile(
                          leading: CircleAvatar(
                              child: Icon(Icons.language_outlined),
                              radius: 40.r,
                              backgroundColor:AppColors.circleBackgroundColor),
                          title: Text(AppTexts.language.tr,
                              style:  context.theme.textTheme.bodyText1),
                          subtitle: Text(
                         settingController.language.name,
                            style:context.theme.textTheme.headline2?.copyWith(

                                fontSize: 16.sp),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
            ],
                ))

    );
  }
}

