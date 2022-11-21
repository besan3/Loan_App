import 'package:dio/dio.dart';

abstract class AuthRepository{
Future<Response> postData( {
  required String phoneNumber
});
Future<Response>  login(

     {
       required String phoneNumber,
       required String code,
     }
     );



}