import 'package:loan_app/modules/home/models/users_model.dart';

class EndPoints{
  static const String baseUrl='https://aseel.sirius-it.dev/api';

static const LOGIN='$baseUrl/login';
static const REQUEST='$baseUrl/request/code';
static const SIGNUP='$baseUrl/user/signup';
static const UPDATE='$baseUrl/user/update';
static const USERS='$baseUrl/users/all';
static AllUsersModel usersModel=AllUsersModel();

}