import 'dart:developer';
import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/core/errors/fauilers.dart';
import 'package:loan_app/features/auth/data/datasources/local_data_source.dart';
import 'package:loan_app/features/auth/data/models/request_code_model.dart';
import 'package:loan_app/features/auth/data/models/verifivation_model.dart';
import 'package:loan_app/features/auth/domain/entities/login_entity.dart';
import 'package:loan_app/features/auth/domain/entities/request_code_entity.dart';
import 'package:loan_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:loan_app/features/auth/domain/usecases/request_code_usecase.dart';
import 'package:loan_app/features/auth/presenttion/pages/setup_account_screen.dart';
import 'package:loan_app/features/home/presenttion/bindings/home_binding.dart';
import 'package:loan_app/features/layout/presenttion/pages/layout.dart';
import 'package:loan_app/features/users/presenttion/controller/all_users_states.dart';
import '../../../../core/network/cache_helper.dart';
import '../../../../core/routes/routes.dart';
import '../pages/verifecation_code_screen.dart';

class LogInController extends GetxController with StateMixin<RequestCodeEntity>{
  var phoneController = TextEditingController();
  var codeController = TextEditingController();
  RequestCodeUseCase requestCodeUseCase;
  LoginUseCase loginUseCase;
  RequestCodeEntity requestCodeModel=RequestCodeEntity(data: 0);
  LogInModel logInEntity=LogInModel(
    user: User()
  );
 // LoginModel loginModel=LoginModel(data: Data(user: User()));
  LogInController({required this.requestCodeUseCase,required this.loginUseCase});
  bool isLoading = false;
  Dio dio = Dio();
  SharedPrefs sharedPrefs=SharedPrefs();
UsersStates initialState=UsersStates.loading;
  @override
  void onInit() {
    super.onInit();
  }
@override
  void onClose() {
    phoneController.dispose();
    codeController.dispose();

  }
  @override
  void onReady() {
    super.onReady();
  }

  startLoading() {
    isLoading = true;
    update();
  }

  endLoading() {
    isLoading = false;
    update();
  }
void requestLoginCode({required String phoneNumber,})async{
  change(requestCodeModel,status: RxStatus.loading());
//  initialState=UsersStates.loading;
  startLoading();
  var response=await requestCodeUseCase.call( phoneNumber);
  endLoading();
  initialState=UsersStates.loading;
print(response);
  response.fold((l) {
    ConnectionFailure();
    Get.snackbar('Erorr',l.toString(),backgroundColor: Colors.red);
initialState=UsersStates.error;endLoading();
  }, (r) {
    initialState=UsersStates.success;
    endLoading();
    requestCodeModel=r;
    if(r.data==null){
      Get.snackbar('Error','Please enter your Phone Number',backgroundColor: Colors.red);
    }else {
      // change(requestCodeModel,status: RxStatus.loading());
      Get.snackbar('Code', requestCodeModel.data.toString());
      Get.to(VerificationScreen(phoneController.text));
    }




  });endLoading();
}

  void logIn(
  {
    required String phoneNumber,
    required String code,
  }
      )async{
    final response=await loginUseCase.call( phoneNumber,code);
    print(response);
    response.fold((l) {
      Get.snackbar('Status','Fail');
      ConnectionFailure();

     // change(requestCodeModel,status: RxStatus.loading());
    }, (r) {
      print(response);
      // logInEntity=r;
      logInEntity.user=r.user;
      logInEntity.token=r.token;
      logInEntity.draft=r.draft;
      Get.snackbar('Status','success');
      Get.to(logInEntity.user!=null?HomeLayout():SetupAccountScreen(phoneNumber),);



    });


  }









}