import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/edit_profile/view/edit_profile_screen.dart';
import 'package:loan_app/modules/profile/setting/view/profile_settings_screen.dart';
import 'package:loan_app/resources/app_images/app_images.dart';

import '../../../resources/app_texts/app_texts.dart';

class SettingsController extends GetxController {
  List<String> cardIcons = [
   AppImages.profileIcon,
 AppImages.debandcredIcon,
    AppImages.settingIcon,
   AppImages.logoutIcon,
  ];
  List<String> cardTitle = [
    AppTexts.personal_details.tr,
    AppTexts.deb_cred.tr,
    AppTexts.setting.tr,
    AppTexts.logout.tr
  ];
  List<Widget> cardScreens = [
    PersonalDetailsScreen(),
    PersonalDetailsScreen(),
    ProfileSettingScreen(),
    PersonalDetailsScreen(),
  ];


}
