import 'package:dio/dio.dart';
import 'package:loan_app/modules/home/models/users_model.dart';
import 'package:loan_app/modules/home/repositories/users_repository.dart';
import 'package:loan_app/resources/network/remote/end_points.dart';

import '../../../resources/network/local/cache_helper.dart';

class UsersApi extends UsersRepository{
  AllUsersModel usersModel=AllUsersModel();
  Dio dio=Dio();
  @override
  Future<AllUsersModel> fetchUsers() async{


try{
  var response=await dio.get('https://aseel.sirius-it.dev/api/users/all',  options: Options(
      headers: {
        'Authorization':'Bearer ${SharedPrefs().token}'
      }
  ));
 usersModel=AllUsersModel.fromJson(response.data);
  print(usersModel.data!.length);
} catch(error){
  print(error.toString());
}
return usersModel;
  }




}