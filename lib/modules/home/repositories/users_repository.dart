import 'package:loan_app/modules/home/models/users_model.dart';

abstract class UsersRepository{
  Future<AllUsersModel> fetchUsers();


}