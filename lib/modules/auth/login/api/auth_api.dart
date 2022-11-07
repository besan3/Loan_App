import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'hide Response;
import 'package:loan_app/modules/auth/repositories/auth_repository.dart';
import 'package:loan_app/resources/network/remote/dio_helper.dart';

import '../../../../resources/network/remote/end_points.dart';

class AuthApi extends AuthRepository{

@override
 void requestCode(
  {
  required String phoneNumber
}
     ){
DioHelper.postData(url: EndPoints.REQUEST, data:{
  'phone_number': phoneNumber,
} ).then((value) {
  print(value.data);
  return Get.snackbar('Code', value.data['data'].toString());

}).catchError((error){
  Get.snackbar('Error', ' Something error ',backgroundColor: Colors.red);

  print(error.toString());
});

 }

  /*@override
  Future<Map<String,dynamic>> postData() async{
    var response = await Dio().post( EndPoints.REQUEST,

        data: {
          'phone_number': phoneNumber,

        }) ;
    if(response.statusCode ==200 ) {

      Get.snackbar('Code', response.data['data'].toString());
      print(response);
    }else {
      Get.snackbar('Error', ' Something error ',backgroundColor: Colors.red);
    }
return response.data;
  }*/

  @override
  void login({required String phoneNumber, required String code}) {
   DioHelper.postData(url: EndPoints.LOGIN, data:{
     'phone_number':phoneNumber,
     'code':code

   }).then((value){
     print(value.data);
     if(value.statusCode==200) {
        Get.snackbar('state', value.statusCode.toString());
      } else{
       Get.snackbar('state', 'error');

     }

   }).catchError((error){
     print(error.toString());
     Get.snackbar('error', error.toString());
   });
  }


}