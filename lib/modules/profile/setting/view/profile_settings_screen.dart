import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/profile/setting/controller/setting_controller.dart';
import 'package:loan_app/shared/colors/app_colors.dart';


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
          backgroundColor: AppColors.primaryColor,
          title: Text('setting'.tr),
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          minimum: EdgeInsets.only(top: 30.h),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(20.h.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(55.r)),
                    color:Get.isDarkMode?AppColors.primaryTextColor:  AppColors.backgroundColor),
                child: GetBuilder<SettingController>(
                 // init: SettingController(),
                  builder:(settingController)=> Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      InkWell(
                        onTap: () => settingController.showBottomSheet(),
                        child: ListTile(
                          leading: CircleAvatar(
                              child: Icon(Icons.brightness_4_outlined),
                              radius: 40.r,
                              backgroundColor: Color(0xffE8F0FF)),
                          title: Text('theme'.tr,
                              style:Theme.of(context).textTheme.bodyText1
                          ),
                          subtitle: Text(
                          settingController.  theme.name,
                            style:Theme.of(context).textTheme.subtitle1?.copyWith(

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
                              backgroundColor: Color(0xffE8F0FF)),
                          title: Text('language'.tr,
                              style:  Theme.of(context).textTheme.bodyText1),
                          subtitle: Text(
                         settingController.language.name,
                            style:Theme.of(context).textTheme.subtitle1?.copyWith(

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

