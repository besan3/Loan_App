import 'package:dio/dio.dart';
import 'package:loan_app/resources/network/remote/end_points.dart';

class DioHelper{
  static Dio dio=Dio();
static init(){
  dio=Dio(
    BaseOptions(
      baseUrl:EndPoints.baseUrl ,
      receiveDataWhenStatusError: true
    )
  );
}
  static Future<Response>postData(
  {
  required String url,
   Map<String,dynamic>? query,
    required Map<String,dynamic>data
}
    )async{
  return dio.post(
  url,
    queryParameters: query,
    data: data
  );
}
}