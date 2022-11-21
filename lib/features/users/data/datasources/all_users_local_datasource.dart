import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:loan_app/core/network/cache_helper.dart';
import '../../../../core/errors/exceptions.dart';
import '../models/all_users_model.dart';

abstract class AllUsersLocalDataSource{
  Future<AllUsersModel>getCachedUsers();
  Future<Unit> cacheUsers(AllUsersModel allUsers);


}
const CACHED_USERS = "CACHED_USERS";
class UsersLocalDataSource implements AllUsersLocalDataSource {
  @override
  Future<Unit> cacheUsers(AllUsersModel allUsers) {
    SharedPrefs.setString(CACHED_USERS, json.encode(allUsers.toJson()));
    return Future.value(unit);
  }

  @override
  Future<AllUsersModel> getCachedUsers() {
    final jsonString = SharedPrefs.getString(CACHED_USERS);
    if (jsonString != null) {
      return Future.value(AllUsersModel.fromJson(json.decode(jsonString)));
    } else {
      throw EmptyCacheException();
    }
  }
}