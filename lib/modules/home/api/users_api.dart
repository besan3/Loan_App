import 'package:dio/dio.dart';
import 'package:loan_app/modules/home/models/users_model.dart';
import 'package:loan_app/modules/home/repositories/users_repository.dart';
import 'package:loan_app/resources/network/remote/end_points.dart';

class UsersApi extends UsersRepository{
  @override
  Future<AllUsersModel> fetchUsers() async{


try{
  var response=await Dio().get('https://aseel.sirius-it.dev/api/users/all');
  EndPoints.usersModel=AllUsersModel.fromJson(response.data);
  print(EndPoints.usersModel.data!.length);
} catch(error){
  print(error.toString());
}
return EndPoints.usersModel;
  }




}