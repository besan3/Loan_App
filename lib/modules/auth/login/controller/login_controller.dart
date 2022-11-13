import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/auth/login/api/auth_api.dart';
import 'package:loan_app/modules/auth/verification/models/verifivation_model.dart';

import '../../../../resources/network/local/cache_helper.dart';
import '../../../../resources/routes/routes.dart';
import '../../verification/view/verifecation_code_screen.dart';

class LogInController extends GetxController {
  var phoneController = TextEditingController();
  var codeController = TextEditingController();
  bool isLoading = false;
  Dio dio = Dio();
AuthApi authApi=AuthApi();
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

  void requestCode({
    required String phoneNumber,
  }) async {
   var response=await authApi.postData(phoneNumber: phoneNumber);

   if(response.statusCode ==200 ) {

     Get.snackbar('Code', response.data['data'].toString());
     Get.to(VerificationScreen(phoneController.text));

     print(response);
   }else {
     Get.snackbar('Error', ' Something error ',backgroundColor: Colors.red);
   }

  }
  void verificationCode({
    required String phoneNumber,
    required String code,

  }) async {
   var response=await authApi.login(phoneNumber: phoneNumber, code: code);

   if(response.statusCode==200) {
     print(response);
     log(response.data.toString());
     SharedPrefs().saveToken(response.data['data']['token']);
     print(sharedPrefs.token);
     Get.toNamed(RoutesClass.getSetupAccountRoute());

     Get.snackbar('state', response.statusCode.toString());

   } else{
     Get.snackbar('state', 'error');

   }

  }

}