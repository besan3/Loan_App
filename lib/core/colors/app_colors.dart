import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppColors{
  static const primaryColor = Color(0xff244AD3);
  static Color primaryTextColor = Color(0xff2A3D4F);
  static const smallTextColor = Color(0xffA5A5A5);
  static Color backgroundColor = Colors.white;
  static Color borderSideColor = Color(0xffCBD4EB);
  static Color headLine3Color =  Color(0xff474F55);
  static Color greyColor =   Color(0xff95989a);
  static Color circleBackgroundColor =   Color(0xffE8F0FF);
  static Color gradint1Color =   Color(0xff6783EA);
  static Color gradint2Color =      Color(0xff62349D);
  static Color subtitleColor =      Color(0xffEBEEF2);
  static Color containerColor =  Get.isDarkMode?    Color(0xff2A3D4F):Colors.white;
 static MaterialColor primarySwatch= MaterialColor(0xff244AD3,<int, Color>{
    50: const Color(0xff244AD3 ),//10%
    100: const Color(0xff244AD3),//20%
    200: const Color(0xff244AD3),//30%
    300: const Color(0xff244AD3),//40%
    400: const Color(0xff244AD3),//50%
    500: const Color(0xff244AD3),//60%
    600: const Color(0xff244AD3),//70%
    700: const Color(0xff244AD3),//80%
    800: const Color(0xff244AD3),//90%
    900: const Color(0xff244AD3),//100%
  });



}