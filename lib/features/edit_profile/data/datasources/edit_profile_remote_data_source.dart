import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'hide Response;
import 'package:get/get_core/src/get_main.dart';
import 'package:loan_app/core/network/end_points.dart';
import 'package:loan_app/features/edit_profile/data/models/edit_profile_data_model.dart';
import 'package:loan_app/features/edit_profile/data/models/edit_profile_model.dart';
import 'package:loan_app/features/edit_profile/domain/entities/edit_profile_data.dart';
import 'package:loan_app/features/edit_profile/domain/entities/edit_profile_entity.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/fauilers.dart';
import '../../../../core/network/cache_helper.dart';

abstract class EditProfileRemoteDataSource{
  Future<EditProfileModel> editProfile({
    required String image,
    required String first_name,
    required String last_name,
    required String email,
    required String date_of_birth,
    required String address,
    required String address_line1,
    required String address_line2,

  });
}

class EditProfileRemoteImp implements EditProfileRemoteDataSource{
  final Dio dio;
  EditProfileRemoteImp({
    required this.dio
});
  @override
  Future<EditProfileModel> editProfile(
  {
    required String image,
    required String first_name,
    required String last_name,
    required String email,
    required String date_of_birth,
    required String address,
    required String address_line1,
    required String address_line2,
}
      )async {
try{
  var response=await dio.post(EndPoints.UPDATE,
  options: Options(
    headers: {
      'Authorization':'Bearer ${SharedPrefs().token}'

    }
  ),
  data:{
    'first_name': first_name,
    'last_name': last_name,
    'email': email,
    'date_of_birth': date_of_birth,
    'address_line1': address_line1,
    'address_line2': address_line2,
    'address': address,
    'image': image,
  }
  );
  var result = EditProfileModel.fromJson(response.data);
  if(response.statusCode ==200 ) {
    Get.snackbar('true', 'true');
    print(response);
    return result;

  }
  else {
    Get.snackbar('Error', ' Something error ',backgroundColor: Colors.red);
  }
  throw BaseException( code: response.statusCode);

}
  on DioError catch(e){
  throw BaseException(message: e.message, code: e.response?.statusCode);
  }on Exception catch(e){
  throw BaseException(message: e.toString());
}
}


}