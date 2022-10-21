import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/profile/setting/controller/settind_controller.dart';
import 'package:loan_app/shared/components/styles/colors.dart';
import 'package:loan_app/shared/components/styles/texts.dart';


class ProfileSettingScreen extends StatefulWidget {
  ProfileSettingScreen({super.key});
  

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor:primaryColor,
          title: Text('Setting'),
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
                    color: backgroundColor),
                child: GetBuilder<SettingController>(
                  init: SettingController(),
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
                              child: Icon(Icons.dark_mode_outlined),
                              radius: 40.r,
                              backgroundColor: Color(0xffE8F0FF)),
                          title: Text('Theme',
                              style: bigTextStyle.copyWith(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : primaryTextColor)),
                          subtitle: Text(
                          settingController.  theme.name,
                            style: smallTextStyle.copyWith(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : primaryTextColor,
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
                          title: Text('Language',
                              style: bigTextStyle.copyWith(
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : primaryTextColor)),
                          subtitle: Text(
                         settingController.   language.name,
                            style: smallTextStyle.copyWith(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : primaryTextColor,
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

