import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/home/views/home_screen.dart';

import '../views/settingsScreen.dart';

class HomeController extends GetxController {
  int index = 0;
  List<Widget> screens = [HomeScreen(), HomeScreen(), SettingScreen()];
  List<Widget> screensIcons = [
    Icon(Icons.home_outlined, color: Colors.grey.shade300),
    Icon(Icons.add, color: Colors.grey.shade300),
    Icon(Icons.settings_outlined, color: Colors.grey.shade300),
  ];
  List<String> screensTitels = [
    ' Welcom, John ',
    ' Welcom, John ',
    'My Profile'
  ];
  void changeScreen(int currentIndex) {
    index = currentIndex;
    update();
  }

  List<String> loanIcons = [
    'assets/images/Arrow 1.png',
        'assets/images/Arrow 6.png'

  ];


}
