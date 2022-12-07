import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:loan_app/core/network/cache_helper.dart';
import 'package:loan_app/features/auth/data/models/verifivation_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/login_entity.dart';

abstract class AuthLocalDataSource{
  Future<LogInModel>getCachedLogin();
  Future<Unit> cacheLogin(String loginModel);
  Future<Unit> cacheUser(String loginModel);


}
const token_key = "token";
const user_key='user';
class AuthLocalImp implements AuthLocalDataSource {
  @override
  Future<Unit> cacheLogin(String token) {
    SharedPrefs.setString(token_key,token );
    return Future.value(unit);
  }

  @override
  Future<LogInModel> getCachedLogin() {
    final jsonString = SharedPrefs.getString(token_key);
    if (jsonString != null) {
      return Future.value(LogInModel.fromJson(json.decode(jsonString)));
    } else {
      throw EmptyCacheException();
    }
  }

  @override
  Future<Unit> cacheUser(String user) {
    SharedPrefs.setString(user_key,user );
    return Future.value(unit);
  }
}