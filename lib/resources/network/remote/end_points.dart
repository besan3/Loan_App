import 'package:loan_app/modules/home/models/users_model.dart';

class EndPoints{
  static const String baseUrl='https://aseel.sirius-it.dev/api';

static const LOGIN='$baseUrl/login';
static const REQUEST='$baseUrl/request/code';
static const SIGNUP='$baseUrl/user/signup';
static const UPDATE='$baseUrl/user/update';
static const USERS='$baseUrl/users/all';
static const DEBITOR='$baseUrl/add_debitor';
static const TOKEN='93|KbtjSGkDAe4Q4nYZsqvtd919W1nefDKiAWtlcps1';
static  String token='';
static  String LOGOUT='$baseUrl/logout';
static  String PAYMENT='$baseUrl/payment';
}