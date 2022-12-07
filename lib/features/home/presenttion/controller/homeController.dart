import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:loan_app/features/home/presenttion/pages/home_screen.dart';
import 'package:loan_app/core/app_images/app_images.dart';
import 'package:loan_app/features/users/data/models/all_users_model.dart';
import 'package:loan_app/features/users/domain/entities/all_users.dart';
import '../../../../core/app_texts/app_texts.dart';
import '../../../../core/errors/fauilers.dart';
import '../../../../core/usecases/usecases.dart';
import '../../../setting/presenttion/pages/settingsScreen.dart';
import '../../../users/data/repositories/all_users_repositoryImp.dart';
import '../../../users/domain/usecases/get_all_users_usecase.dart';

class HomeController extends GetxController with StateMixin<AllUsers> {
 // final GetAllUsersUseCase getAllUsersUseCase;
   AllUsers allUsersModel=AllUsers(data: []);
  HomeController();
  int index = 0;
  bool show=false;
  List<Widget> screens = [HomeScreen(),SettingScreen()];
  List<Widget> screensIcons = [
    Icon(Icons.home_outlined, color: Colors.grey.shade300),
   // Icon(Icons.add, color: Colors.grey.shade300),
    Icon(Icons.settings_outlined, color: Colors.grey.shade300),
  ];

  @override
  void onReady() {
    //getUsers();
  }
  void showIcons(){

    update();

  }
  List<BottomNavigationBarItem> items=[
    BottomNavigationBarItem(
      icon:     Icon(Icons.home_outlined, ),
      label: 'Home'
    ),
    BottomNavigationBarItem(
        icon:        Icon(Icons.settings_outlined,),

        label: 'Setting'
    ),

  ];
  List<String> screensTitels = [
    AppTexts.home_welcome,
   // AppTexts.home_welcome,
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
  NoParams noParams=NoParams();
//   Future getUsers()async{
//     change(allUsersModel,status: RxStatus.loading());
//     var response= await getAllUsersUseCase?.call(noParams);
//
//     print(response);
//     response?.fold((l) {ConnectionFailure();
//
//     change(allUsersModel,status: RxStatus.error());
//     } , (r) {
// allUsersModel=r;
//
//       update();
//       change(allUsersModel,status: RxStatus.success());
//
//
//     } );
//   }


}
