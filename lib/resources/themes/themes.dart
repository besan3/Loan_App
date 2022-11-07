import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_app/resources/colors/app_colors.dart';
import 'package:loan_app/resources/app_sizes/app_sizes.dart';

class AppThemes{
 final CustomDarkTheme=ThemeData.dark().copyWith(
     appBarTheme: AppBarTheme(
      color:  AppColors.primaryColor,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: AppSizes.fontSize20.sp,
            fontWeight: FontWeight.w600,
          color: Colors.white
        )
    ),
     buttonTheme: ButtonThemeData(
       minWidth: double.infinity,
       height: AppSizes.height60.h,
       shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(AppSizes.radius10/2.r)),
       buttonColor: AppColors.primaryColor
     ),
     cardTheme: CardTheme(
  shape:  RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSizes.radius10.r),
      side: BorderSide(color:AppColors.primaryColor.withOpacity(0.5))),
),
     backgroundColor: AppColors.primaryColor,
     textTheme: TextTheme(
  bodyText1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: AppSizes.fontSize20.sp,
    fontFamily: 'Poppins',
  ),
  bodyText2: TextStyle(
      color: AppColors.primaryTextColor,
      fontSize: AppSizes.fontSize18.sp,
      fontWeight: FontWeight.w400
  ),
  subtitle1: TextStyle(
      fontSize: AppSizes.fontSize18.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white
  ),
  headline1: TextStyle(
      color: AppColors.primaryColor,
      fontSize: AppSizes.fontSize20.sp,
      fontWeight: FontWeight.w600
  ),
  headline2: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: AppSizes.fontSize14.sp,
    fontFamily: 'Poppins',
  ),
headline5: TextStyle(
    fontSize: AppSizes.fontSize16.sp,
    fontWeight: FontWeight.w400,
  color: AppColors.smallTextColor
),
  headline3: TextStyle(
color:     AppColors.headLine3Color,
fontWeight: FontWeight.w400,
  fontSize:  AppSizes.fontSize16.sp,),

  headline4: TextStyle(
      color:AppColors.greyColor,
      fontSize:  AppSizes.fontSize16.sp,
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
           fontSize: AppSizes.fontSize20.sp,
           fontWeight: FontWeight.w600,
             color: Colors.white
   )
   ),
   buttonTheme: ButtonThemeData(
       minWidth: double.infinity,
       height: AppSizes.height60.h,
       shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(AppSizes.radius10/2.r)),
       buttonColor: AppColors.primaryColor,
    textTheme: ButtonTextTheme.primary
   ),

   cardTheme: CardTheme(
     color: Colors.white,
     shape:  RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(AppSizes.radius10.r),
         side: BorderSide(color:AppColors.primaryColor.withOpacity(0.5))),
   ),

    textTheme:  TextTheme(
        bodyText1: TextStyle(
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.w600,
            fontSize: AppSizes.fontSize20.sp,
          fontFamily: 'Poppins',
        ),bodyText2: TextStyle(
        color: AppColors.primaryTextColor,
        fontSize: AppSizes.fontSize18.sp,
        fontWeight: FontWeight.w400
    ),
      subtitle1: TextStyle(
          fontSize: AppSizes.fontSize18.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.primaryTextColor
      ),headline1: TextStyle(
        color: AppColors.primaryColor,
        fontSize: AppSizes.fontSize20.sp,
        fontWeight: FontWeight.w600
    ),
      headline2: TextStyle(
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w400,
          fontSize: AppSizes.fontSize14.sp,
        fontFamily: 'Poppins',
      ),
        headline3: TextStyle(
            color:     AppColors.headLine3Color,
            fontWeight: FontWeight.w400,
            fontSize:  AppSizes.fontSize16.sp,),

      headline4: TextStyle(
          color:AppColors.greyColor,
          fontSize: AppSizes.fontSize16.sp,
          fontWeight: FontWeight.w400
      ),
    ),

   primaryColor: AppColors.primaryColor,

  );
}
