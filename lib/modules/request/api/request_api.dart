import 'package:dio/dio.dart';
import 'package:loan_app/resources/network/remote/end_points.dart';

class RequestApi {
  Dio dio=Dio();
  Future<Response> addDebitor({

  required String phoneNumber,
  required String deadLine,
  required String amount,
  required String note,
})async{
    Response response=await dio.post(EndPoints.DEBITOR,
    data: {
      'phone':phoneNumber,
      'amount':amount,
      'deadline':deadLine,
      'note':note
    }
    );
    return response;


  }



}