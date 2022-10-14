import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/shared/components/styles/texts.dart';
import 'package:loan_app/viewModels/home_model.dart';
import 'package:loan_app/viewModels/loan_model.dart';
import 'package:loan_app/viewModels/notification_model.dart';
import 'package:loan_app/viewModels/setting_model.dart';
import 'package:loan_app/views/home/pay_loan_screen.dart';

import 'styles/colors.dart';

Future navigatTo(context, Widget widget) =>
    Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
Future navigatAndRemove(context, Widget widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

Widget defaultButton(

  String text, {
    double?   width,
  context,
  Widget? screen,
  double? radius = 5,
  double? height = 60,
}) =>
    Container(
      width: double.infinity,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius!)),
        color: primaryColor,
        height: height,
        onPressed: () {
          navigatTo(context, screen!);
        },
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
    );
Widget defaultTextForm(
        {required TextEditingController textEditingController,
        required TextInputType textInputType,
        ValueChanged<String>? onFieldSubmitted,
        ValueChanged<String>? onChanged,
        GestureTapCallback? onTap,
        bool isPassword = false,
        required FormFieldValidator<String> validator,
        required String label,
        IconData? iconData,
        IconData? iconDataSuffixx,
        bool isenable = true,
        bool hasPrefixIcon = false}) =>
    TextFormField(
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

Widget defaultCard(HomeModel homeModel) {
  return InkWell(
    onTap: (() => Get.to(LoanScreen())),
    child: Container(
      width: 335,
      height: 97.5,
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: Color(0xff244AD3).withOpacity(0.5))),
        child: ListTile(
          leading: Image.asset(
            homeModel.image!,
            width: 65,
            height: 65,
          ),
          title: Text(homeModel.name!),
          subtitle: Text(homeModel.number!),
        ),
      ),
    ),
  );
}

Widget defaultProfileCard(SettingModel settingModel) {
  return Container(
    width: 335,
    height: 97.5,
    child: Card(
     // margin: EdgeInsets.only(top: 20),
      child: ListTile(
        leading: Padding(
          padding: const EdgeInsets.only(top:10.0),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xffE8F0FF),
            child: Image.asset(
              settingModel.cardIcon!,
              width: 21,
              height: 21,
            ),
          ),
        ),
        title: InkWell(
            onTap: () => Get.to(settingModel.screen),
            child: Text(
              settingModel.title!,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff95989A)),
            )),
      ),
    ),
  );
}

Widget defaultNotificationsItem(NotificationModel notificationModel) {
  return Container(
        width: 337,
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
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 150,
              child: defaultButton('Reject',width: 150)),
               Container(
              width: 150,
              child: defaultButton('Reject',width: 150)),
          ],
        ),
                SizedBox(height: 20,),

      ],
    ),
  );
}

Widget defaultLoanCard(LoanModel loanModel) {
  return ListTile(
title: Text(loanModel.number!,
style: bigTextStyle.copyWith(fontSize: 16,color: primaryTextColor),
),
subtitle: Text(loanModel.date!,),
leading: Container(
  width: 56,height: 56,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(12),
    color: Color(0xffF0EFFF)
  ),
  child: Image.asset(loanModel.icon!,width: 20,height: 20,)),
trailing: Text(loanModel.amount!,
style: bigTextStyle.copyWith(fontSize: 16,color: primaryTextColor),

),
  );
}
