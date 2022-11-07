import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/network/remote/end_points.dart';

class SetUpController extends GetxController{
  var firstNameController=TextEditingController();
  var lastNameController=TextEditingController();
  var emailController=TextEditingController();
  var dObController=TextEditingController();
  var locationController=TextEditingController();
  var location1Controller=TextEditingController();
  var location2Controller=TextEditingController();
  Dio dio = Dio();

  void setup({
    required String firstName,
    required String lastName,
    required String email,
    required String dob,
    required String address,
    required String address1,
    required String address2,

  }) async {
    var response = await dio.post( EndPoints.SIGNUP,

        data: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'date_of_birth': dob,
          'address': address,
          'address_line1': address1,
          'address_line2': address2,

        }) ;
    if(response.statusCode ==200 ) {

      Get.snackbar('true', 'true');
      print(response);
    }else {
      Get.snackbar('Error', ' Something error ',backgroundColor: Colors.red);
    }

    // ).then((value) {
    //   log(value.toString());
    //   update();
    // }).catchError((e){
    //   print(e.toString());
    // });
  }





}