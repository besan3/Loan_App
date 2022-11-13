import 'package:dio/dio.dart';
import 'package:loan_app/resources/network/local/cache_helper.dart';

import '../../../resources/network/remote/end_points.dart';

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