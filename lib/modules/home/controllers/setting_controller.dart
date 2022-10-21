import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/profile/personal_details/view/personal_detailes_screen.dart';
import 'package:loan_app/modules/profile/setting/view/profile_settings_screen.dart';

class SettingsController extends GetxController {
  List<String> cardIcons = [
    'assets/images/Vector (1).png',
    'assets/images/Vector (2).png',
    'assets/images/Vector (3).png',
    'assets/images/Vector (4).png',
  ];
  List<String> cardTitle = [
    'Presonal Details',
    'Debtors and credtors',
    'Setting',
    'Log Out'
  ];
  List<Widget> cardScreens = [
    PersonalDetailsScreen(),
    PersonalDetailsScreen(),
    ProfileSettingScreen(),
    PersonalDetailsScreen(),
  ];


}
