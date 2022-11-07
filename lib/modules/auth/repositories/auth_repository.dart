import 'package:dio/dio.dart';

abstract class AuthRepository{
void requestCode( {
  required String phoneNumber
});
 void login(

     {
       required String phoneNumber,
       required String code,
     }
     );



}