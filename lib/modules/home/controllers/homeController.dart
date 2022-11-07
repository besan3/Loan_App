import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/home/api/users_api.dart';
import 'package:loan_app/modules/home/models/users_model.dart';
import 'package:loan_app/modules/home/repositories/users_repository.dart';
import 'package:loan_app/modules/home/views/home_screen.dart';
import 'package:loan_app/resources/app_images/app_images.dart';

import '../../../resources/app_texts/app_texts.dart';
import '../../setting/view/settingsScreen.dart';

class HomeController extends GetxController {
  int index = 0;
  List<Widget> screens = [HomeScreen(), HomeScreen(), SettingScreen()];
  List<Widget> screensIcons = [
    Icon(Icons.home_outlined, color: Colors.grey.shade300),
    Icon(Icons.add, color: Colors.grey.shade300),
    Icon(Icons.settings_outlined, color: Colors.grey.shade300),
  ];
  List<String> screensTitels = [
    AppTexts.home_welcome,
    AppTexts.home_welcome,
    AppTexts.my_profile
  ];
  void changeScreen(int currentIndex) {
    index = currentIndex;
    update();
  }

  List<String> loanIcons = [
   AppImages.arrowIcon,
   AppImages.arrow2Icon

  ];

AllUsersModel? usersModel;

 getAllUsers()async{
  UsersApi().fetchUsers();
}
}
