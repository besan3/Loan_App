import 'package:flutter/material.dart';
import 'package:loan_app/shared/colors/app_colors.dart';

class AppThemes{
static final CustomDarkTheme=ThemeData.dark().copyWith(
/*
      fontFamily: 'Poppins',
    primarySwatch: AppColors.primarySwatch,
*/

    appBarTheme: AppBarTheme(
      color:  AppColors.primaryColor,

    ),
    backgroundColor: Colors.red,
textTheme: TextTheme(
  bodyText1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 20
  ),
  subtitle1: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w400,
      fontSize: 14
  ),
)

  );
static final CustomLightTheme=ThemeData.light().copyWith(
/*
    fontFamily: 'Poppins',
    primarySwatch: AppColors.primarySwatch,
*/

    textTheme:  TextTheme(
        bodyText1: TextStyle(
            color: AppColors.primaryTextColor,
            fontWeight: FontWeight.w600,
            fontSize: 20
        ),
      subtitle1: TextStyle(
          color: AppColors.primaryTextColor,
          fontWeight: FontWeight.w400,
          fontSize: 14
      ),

    ),
  );
}
