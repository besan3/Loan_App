import 'package:dio/dio.dart';
import 'package:loan_app/resources/network/remote/end_points.dart';

import '../../../resources/network/local/cache_helper.dart';

class RequestApi {
  Dio dio=Dio();
  Future<Response> addDebtor({

  required String phoneNumber,
  required String deadLine,
  required String amount,
  required String note,
})async{
    Response response=await dio.post(

        EndPoints.DEBITOR,
    data: {
      'phone':phoneNumber,
      'amount':amount,
      'deadline':deadLine,
      'note':note
    },
        options: Options(
            headers: {
              'Authorization':'Bearer ${SharedPrefs().token}'
            }
        )
    );
    return response;


  }

  Future<Response> pay({

    required String phoneNumber,

    required String amount,
    required String note,
  })async{
    Response response=await dio.post(EndPoints.PAYMENT,
        data: {
          'phone':phoneNumber,
          'amount':amount,
          'note':note
        }
    );
    return response;


  }

}