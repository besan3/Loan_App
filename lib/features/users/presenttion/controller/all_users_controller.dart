import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/core/app_texts/app_texts.dart';
import 'package:loan_app/core/errors/exceptions.dart';
import 'package:loan_app/core/errors/fauilers.dart';
import 'package:loan_app/core/usecases/usecases.dart';
import 'package:loan_app/features/home/data/models/card_model.dart';
import 'package:loan_app/features/home/domain/entities/card_entity.dart';
import 'package:loan_app/features/home/domain/usecases/get_card_usecase.dart';
import 'package:loan_app/features/users/data/models/all_users_model.dart';
import 'package:loan_app/features/users/data/repositories/all_users_repositoryImp.dart';
import 'package:loan_app/features/users/domain/entities/all_users.dart';
import 'package:loan_app/features/users/domain/entities/all_users_data.dart';
import 'package:loan_app/features/users/domain/usecases/get_all_users_usecase.dart';
import 'package:loan_app/features/users/presenttion/controller/all_users_states.dart';

import '../../../../core/app_images/app_images.dart';
import '../../../../core/states/views_states.dart';
import '../../../home/presenttion/pages/home_screen.dart';
import '../../../setting/presenttion/pages/settingsScreen.dart';

class AllUsersController extends GetxController with StateMixin<AllUsersModel>{
final GetAllUsersUseCase? getAllUsersUseCase;
final GetCardDataUseCase? getCardDataUseCase;
AllUsersModel allUsersModel=AllUsersModel(data: []);
CardEntity cardEntity=CardEntity(data: CardData(nearCreditor: NearCreditor(),nearDebitor: NearCreditor()));
AllUsersController({required this.getAllUsersUseCase,required this.getCardDataUseCase});

int index = 0;
bool show=false;
List<Widget> screens = [HomeScreen(),SettingScreen()];
List<Widget> screensIcons = [
  Icon(Icons.home_outlined, color: Colors.grey.shade300),
  // Icon(Icons.add, color: Colors.grey.shade300),
  Icon(Icons.settings_outlined, color: Colors.grey.shade300),
];
void showIcons(){

  update();

}
var dateTime = DateTime.parse(DateTime.now().toString());
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
  @override
  void onInit() {
    getCard();
   getUsers();
  }
  @override
  void onReady() {
  }

NoParams noParams=NoParams();
  Future getUsers()async{
    change(allUsersModel,status: RxStatus.loading());
var response= await getAllUsersUseCase?.call(noParams);

print(response);
response?.fold((l) {ConnectionFailure();

change(allUsersModel,status: RxStatus.error());
} , (r) {

  allUsersModel.data =r.data;
  allUsersModel.success =r.success;
  allUsersModel.message =r.message;

 update();
    change(allUsersModel,status: RxStatus.success());


} );
  }

Future getCard()async{
 // change(allUsersModel,status: RxStatus.loading());
  var response= await getCardDataUseCase?.call();

  print(response);
  response?.fold((l) {ConnectionFailure();

  change(allUsersModel,status: RxStatus.error());
  } , (r) {
    cardEntity=r;

    update();
    change(allUsersModel,status: RxStatus.success());


  } );
}

}