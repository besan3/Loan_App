import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/shared/components/styles/texts.dart';
import 'package:loan_app/views/home/pay_loan_screen.dart';

import '../../models/home_model.dart';
import '../../models/loan_model.dart';
import '../../models/notification_model.dart';
import '../../models/setting_model.dart';
import 'styles/colors.dart';

class DefaultContainer extends StatelessWidget {
Widget widget;
DefaultContainer(this.widget);
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.only(top: 30.h),
          padding: EdgeInsets.all(20.h.w),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(55.r)),
              color: backgroundColor),
          child: widget,
        ));
  }
}


class DefaultButton extends StatelessWidget {
  String text;
  double? width;

  String? screen;
      double? radius ;
  double? height ;
DefaultButton({
 required this.text,
  this.width,
  this.height=60,
  this.radius=5,
  this.screen

});
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!)),
        color: primaryColor,
        height: height,
        onPressed: () {
          Get.toNamed(screen!);
        },
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18.sp),
        ),
      ),
    );
  }
}
class DefaultCard extends StatelessWidget {
  String text;
  double? width;


  double? radius ;
  double? height ;
  DefaultCard({
    required this.text,
    this.width,
    this.height=60,
    this.radius=5,


  });
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: height,
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!)),
        color: primaryColor,


        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18.sp),
          ),
        ),
      ),
    );
  }
}

class DefaultTextForm extends StatelessWidget {
  TextEditingController textEditingController;
  TextInputType textInputType;
  ValueChanged<String>? onFieldSubmitted;
      ValueChanged<String>? onChanged;
  bool isPassword;
  FormFieldValidator<String> validator;
  GestureTapCallback? onTap;
  String label;
  IconData? iconData;
      IconData? iconDataSuffixx;
  bool isenable;
      bool hasPrefixIcon;
  DefaultTextForm(
      {
        required this. textEditingController,
        required this. textInputType,
    this. onFieldSubmitted,
       this. onChanged,
  this. onTap,
    this.isPassword = false,
        required this.validator,
        required this. label,
       this. iconData,
       this. iconDataSuffixx,
    this. isenable = true,
  this. hasPrefixIcon = false});
  @override
  Widget build(BuildContext context) {
    return     TextFormField(
      controller: textEditingController,
      keyboardType: textInputType,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      validator: validator,
      onTap: onTap,
      enabled: isenable,
      obscureText: isPassword,
      decoration: InputDecoration(
          label: Text(label),
          labelStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xffA5A5A5),
          ),
          // icon: Icon(iconData),

          prefixIcon: hasPrefixIcon ? Icon(iconData) : null,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Color(0xffCBD4EB)))),
    );

  }
}


class HomeCard extends StatelessWidget {
HomeModel homeModel;
HomeCard({
  required this.homeModel
});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => Get.to(LoanScreen())),
      child: Container(
        width: 335.w,
        height: 97.5.h,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: BorderSide(color: Color(0xff244AD3).withOpacity(0.5))),
          child: ListTile(
            leading: Image.asset(
              homeModel.image!,
              width: 65.w,
              height: 65.h,
            ),
            title: Text(homeModel.name!),
            subtitle: Text(homeModel.number!),
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  SettingModel settingModel;
  ProfileCard(this.settingModel);
  @override
  Widget build(BuildContext context) {
    return Container(
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
              onTap: () => Get.to(settingModel.screen),
              child: Text(
                settingModel.title!,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff95989A)),
              )),
        ),
      ),
    );
  }
}

class NotificationsItem extends StatelessWidget {
  NotificationModel notificationModel;
  NotificationsItem(this.notificationModel);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 337.w,
      child: Column(
        children: [
          ListTile(
            leading: Image.asset(notificationModel.image!),
            title: Text(notificationModel.name!),
            subtitle: Text(
              notificationModel.description!,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: Text(notificationModel.time!),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(width: 150.w, child: DefaultCard(text:'Reject', width: 150.w,)),
              Container(width: 150.w, child: DefaultCard(text:'Reject', width: 150.w)),
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}

class DefaultLoanCard extends StatelessWidget {
  LoanModel loanModel;
  DefaultLoanCard(this.loanModel);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        loanModel.number!,
        style: bigTextStyle.copyWith(fontSize: 16.sp, color: primaryTextColor),
      ),
      subtitle: Text(
        loanModel.date!,
      ),
      leading: Container(
          width: 56.w,
          height: 56.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r), color: Color(0xffF0EFFF)),
          child: Image.asset(
            loanModel.icon!,
            width: 20.w,
            height: 20.h,
          )),
      trailing: Text(
        loanModel.amount!,
        style: bigTextStyle.copyWith(fontSize: 16.sp, color: primaryTextColor),
      ),
    );
  }
}

