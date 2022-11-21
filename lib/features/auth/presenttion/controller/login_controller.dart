import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/network/cache_helper.dart';
import '../../../../core/routes/routes.dart';
import '../pages/verifecation_code_screen.dart';
import '../../data/models/auth_api.dart';

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