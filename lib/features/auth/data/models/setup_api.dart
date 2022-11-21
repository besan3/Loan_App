import 'package:dio/dio.dart';
import 'package:loan_app/core/network/cache_helper.dart';

import '../../../../core/network/end_points.dart';

class SetUpApi{
  Dio dio=Dio();
  Future<Response> setup({
    required String firstName,
    required String lastName,
    required String email,
    required String dob,
    required String address,


  })async{
    var response = await dio.post( EndPoints.SIGNUP,

        data: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'date_of_birth': dob,
          'address': address,


        },
    options: Options(
      headers: {
        'Authorization':'Bearer ${SharedPrefs().token}'
      }
    )
    ) ;
    return response;
  }


}