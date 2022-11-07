import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/auth/login/api/auth_api.dart';

class LogInController extends GetxController {
  var phoneController = TextEditingController();
  var codeController = TextEditingController();
  bool isLoading = false;
  Dio dio = Dio();

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
    AuthApi().requestCode(phoneNumber: phoneNumber);

  /*  var response = await Dio().post( EndPoints.REQUEST,

        data: {
          'phone_number': phoneNumber,

        }) ;
    if(response.statusCode ==200 ) {

      Get.snackbar('Code', response.data['data'].toString());
      print(response);
    }else {
      Get.snackbar('Error', ' Something error ',backgroundColor: Colors.red);
    }
*/

  }
  void verificationCode({
    required String phoneNumber,
    required String code,

  }) async {
   AuthApi().login(phoneNumber: phoneNumber, code: code);


  }

}