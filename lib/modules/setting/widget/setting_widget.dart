import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/setting/models/setting_model.dart';

class SettingCard extends StatelessWidget {
  SettingModel settingModel;
  SettingCard(this.settingModel);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => Get.to(settingModel.screen),
      child: Container(
        width: 335.w,
        height: 97.5.h,
        child: Card(
          // margin: EdgeInsets.only(top: 20),
          child: ListTile(
            leading: Padding(
              padding:  EdgeInsets.only(top: 10.0.h),
              child: CircleAvatar(
                radius: 40.r,
                backgroundColor: Color(0xffE8F0FF),
                child: Image.asset(
                  settingModel.cardIcon!,
                  width: 21.w,
                  height: 21.h,
                ),
              ),
            ),
            title: InkWell(
              //  onTap: () => Get.to(settingModel.screen),
                child: Text(
                  settingModel.title!,
                  style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff95989A)),
                )),
          ),
        ),
      ),
    );
  }
}
