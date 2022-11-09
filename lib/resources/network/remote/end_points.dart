import 'package:loan_app/modules/home/models/users_model.dart';

class EndPoints{
  static const String baseUrl='https://aseel.sirius-it.dev/api';

static const LOGIN='$baseUrl/login';
static const REQUEST='$baseUrl/request/code';
static const SIGNUP='$baseUrl/user/signup';
static const UPDATE='$baseUrl/user/update';
static const USERS='$baseUrl/users/all';
static const DEBITOR='$baseUrl/add_debitor';
static AllUsersModel usersModel=AllUsersModel();
static const TOKEN='78|P16jRWSqMwjxOWc4vuz7RBFgqcSYp7YfhsenK0gU';
static  String token='';
static  String LOGOUT='$baseUrl/logout';
}