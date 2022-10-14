import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/views/profile/personal_detailes_screen.dart';
import 'package:loan_app/views/profile/profile_settings_screen.dart';

class SettingController extends GetxController {
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
  List<String> setting = ['Theme', 'Language'];
  List<String> settingSubTitles = ['Dark', 'English'];
  Theme theme = Theme.Light;

  void changeValue(Theme value) {
    theme = value;
    // update();
  }

  void openBottomSheet() {
    Get.bottomSheet(
      Column(
        children: [
          const SizedBox(height: 20),
          ListTile(
              title: Text('System default '),
              leading: Radio<Theme>(
                  value: Theme.System,
                  groupValue: theme,
                  onChanged: (value) {
                    update();

                    changeValue(value!);
                    update();
                  })),
          ListTile(
            title: Text('Light '),
            leading: Radio<Theme>(
                value: Theme.Light,
                groupValue: theme,
                onChanged: (value) {
                  update();

                  changeValue(value!);
                  update();
                  //  Get.changeTheme(ThemeData.light());
                }),
          ),
          ListTile(
            title: Text('Dark '),
            leading: Radio<Theme>(
                value: Theme.Dark,
                groupValue: theme,
                onChanged: (value) {
                  update();

                  changeValue(value!);
                  update();
                  //  Get.changeTheme(ThemeData.dark());
                }),
          ),
       
        ],
      ),
      backgroundColor: Color(0xffE8F0FF),
      elevation: 0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(60))),
    );
  
  }
}

enum Theme { System, Light, Dark }
