import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
              color: Get.isDarkMode?primaryTextColor:Colors.white),
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
          if(screen=='/')
            Get.offAllNamed(screen!);
          else
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






