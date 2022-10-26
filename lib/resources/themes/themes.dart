import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_app/resources/colors/app_colors.dart';

class AppThemes{
 final CustomDarkTheme=ThemeData.dark().copyWith(
     appBarTheme: AppBarTheme(
      color:  AppColors.primaryColor,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          color: Colors.white
        )
    ),
cardTheme: CardTheme(
  shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.r),
      side: BorderSide(color:AppColors.primaryColor.withOpacity(0.5))),
),
   backgroundColor: AppColors.primaryColor,

textTheme: TextTheme(
  bodyText1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 20.sp,
    fontFamily: 'Poppins',
  ),
  bodyText2: TextStyle(
      color: AppColors.primaryTextColor,
      fontSize: 18.sp,
      fontWeight: FontWeight.w400
  ),
  subtitle1: TextStyle(
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white
  ),
  headline1: TextStyle(
      color: AppColors.primaryColor,
      fontSize: 20.sp,
      fontWeight: FontWeight.w600
  ),
  headline2: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 14.sp,
    fontFamily: 'Poppins',
  ),
headline5: TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  color: AppColors.smallTextColor
),
  headline3: TextStyle(
color:     AppColors.headLine3Color,
fontWeight: FontWeight.w400,
  fontSize: 16),

  headline4: TextStyle(
      color:AppColors.greyColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,

  ),
),

  );
 final CustomLightTheme=ThemeData.light().copyWith(
   appBarTheme: AppBarTheme(
     color: AppColors.primaryColor,
         elevation: 0.0,
         titleTextStyle: TextStyle(
       fontFamily: 'Poppins',
           fontSize: 20.sp,
           fontWeight: FontWeight.w600,
             color: Colors.white
   )
   ),
   cardTheme: CardTheme(
     color: Colors.white,
     shape:  RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10.r),
         side: BorderSide(color:AppColors.primaryColor.withOpacity(0.5))),
   ),

    textTheme:  TextTheme(
        bodyText1: TextStyle(
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
          fontFamily: 'Poppins',
        ),
      subtitle1: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryTextColor
      ),
      headline2: TextStyle(
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 14.sp,
        fontFamily: 'Poppins',
      ),
        headline3: TextStyle(
            color:     AppColors.headLine3Color,
            fontWeight: FontWeight.w400,
            fontSize: 16),

      headline4: TextStyle(
          color:AppColors.greyColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w400
      ),
    ),

   primaryColor: AppColors.primaryColor,

  );
}
