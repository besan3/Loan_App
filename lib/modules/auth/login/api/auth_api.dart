import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'hide Response;
import 'package:loan_app/modules/auth/repositories/auth_repository.dart';
import 'package:loan_app/resources/network/remote/dio_helper.dart';

import '../../../../resources/network/remote/end_points.dart';

class AuthApi extends AuthRepository{
  Dio dio=Dio();
  @override
  Future<Response> postData({
  required String phoneNumber
}) async{
    var response = await dio.post( EndPoints.REQUEST,

        data: {
          'phone_number': phoneNumber,

        }) ;

return response;
  }

  @override
  Future<Response>  login(
      {required String phoneNumber,
        required String code}
        ) async{
    var response= await dio.post(EndPoints.LOGIN, data:{
     'phone_number':phoneNumber,
     'code':code

   });
    return response;
  }


}