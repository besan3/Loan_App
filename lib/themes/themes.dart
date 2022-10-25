import 'package:flutter/material.dart';
import 'package:loan_app/shared/colors/app_colors.dart';

class AppThemes{
 final CustomDarkTheme=ThemeData.dark().copyWith(
     appBarTheme: AppBarTheme(
      color:  AppColors.primaryColor,
        elevation: 0.0,
        titleTextStyle: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 20,
            fontWeight: FontWeight.w600,
          color: Colors.white
        )
    ),
    backgroundColor: AppColors.primaryColor,
textTheme: TextTheme(
  bodyText1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 20,
    fontFamily: 'Poppins',
  ),
  headline2: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    fontFamily: 'Poppins',
  ),

  headline3: TextStyle(
color:     Color(0xff474F55),
fontWeight: FontWeight.w400,
  fontSize: 16)
)

  );
 final CustomLightTheme=ThemeData.light().copyWith(
   appBarTheme: AppBarTheme(
     color: AppColors.primaryColor,
         elevation: 0.0,
         titleTextStyle: TextStyle(
       fontFamily: 'Poppins',
           fontSize: 20,
           fontWeight: FontWeight.w600,
             color: Colors.white
   )
   ),

    textTheme:  TextTheme(
        bodyText1: TextStyle(
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          fontFamily: 'Poppins',
        ),
      headline2: TextStyle(
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 14,
        fontFamily: 'Poppins',
      ),
        headline3: TextStyle(
            color:     Color(0xff474F55),
            fontWeight: FontWeight.w400,
            fontSize: 16)
    ),primaryColor: AppColors.primaryColor,

  );
}
