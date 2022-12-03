import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:loan_app/core/network/cache_helper.dart';
import 'package:loan_app/features/auth/data/models/verifivation_model.dart';
import '../../../../core/errors/exceptions.dart';

abstract class AuthLocalDataSource{
  Future<LoginModel>getCachedLogin();
  Future<Unit> cacheLogin(LoginModel loginModel);


}
const LOGIN = "LOGIN";
class AuthLocalImp implements AuthLocalDataSource {
  @override
  Future<Unit> cacheLogin(LoginModel loginModel) {
    SharedPrefs.setString(LOGIN, json.encode(loginModel.toJson()));
    return Future.value(unit);
  }

  @override
  Future<LoginModel> getCachedLogin() {
    final jsonString = SharedPrefs.getString(LOGIN);
    if (jsonString != null) {
      return Future.value(LoginModel.fromJson(json.decode(jsonString)));
    } else {
      throw EmptyCacheException();
    }
  }
}