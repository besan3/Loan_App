import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/core/errors/fauilers.dart';
import 'package:loan_app/features/auth/data/models/request_code_model.dart';
import 'package:loan_app/features/auth/data/models/verifivation_model.dart';
import 'package:loan_app/features/auth/domain/entities/login_entity.dart';
import 'package:loan_app/features/auth/domain/entities/request_code_entity.dart';
import 'package:loan_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:loan_app/features/auth/domain/usecases/request_code_usecase.dart';
import 'package:loan_app/features/auth/presenttion/pages/setup_account_screen.dart';
import '../../../../core/network/cache_helper.dart';
import '../../../../core/routes/routes.dart';
import '../pages/verifecation_code_screen.dart';

class LogInController extends GetxController with StateMixin<RequestCodeEntity>{
  var phoneController = TextEditingController();
  var codeController = TextEditingController();
  RequestCodeUseCase requestCodeUseCase;
  LoginUseCase loginUseCase;
  RequestCodeEntity requestCodeModel=RequestCodeEntity(data: 0);
  LoginModel loginModel=LoginModel(data: Data(user: User()));
  LogInController({required this.requestCodeUseCase,required this.loginUseCase});
  bool isLoading = false;
  Dio dio = Dio();
  SharedPrefs sharedPrefs=SharedPrefs();

  @override
  void onInit() {
    super.onInit();
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
  var response=await requestCodeUseCase.call( phoneNumber);
print(response);
  response.fold((l) {
    ConnectionFailure();
    Get.snackbar('Erorr',l.toString(),backgroundColor: Colors.red);

  }, (r) {
    requestCodeModel=r;
    change(requestCodeModel,status: RxStatus.loading());
    Get.snackbar('Code',requestCodeModel.data.toString());
        Get.to(VerificationScreen(phoneController.text));





  });
}

  void logIn(
  {
    required String phoneNumber,
    required String code,
  }
      )async{
    var response=await loginUseCase.call( phoneNumber,code);
    print(response);
    response.fold((l) {
      Get.snackbar('Status','Fail');
      ConnectionFailure();

     // change(requestCodeModel,status: RxStatus.loading());
    }, (r) {
      print(response);
      loginModel.data=r.data;
      Get.snackbar('Status','success');
      Get.to(SetupAccountScreen(phoneNumber));


    });


  }









}