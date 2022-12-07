import 'package:dio/dio.dart';
import 'package:loan_app/core/errors/exceptions.dart';
import 'package:loan_app/features/users/data/models/all_users_model.dart';
import 'package:loan_app/core/network/end_points.dart';
import '../../../../core/network/cache_helper.dart';
abstract class AllUsersRemoteDataSource{
Future <AllUsersModel> getAllUsers();


}
class UsersRemoteDataSource implements AllUsersRemoteDataSource {
  final Dio dio;
  UsersRemoteDataSource({
    required this.dio
});
  @override
  Future<AllUsersModel> getAllUsers()async {

   Response response=await dio.get('https://aseel.sirius-it.dev/api/users/all',
     options: Options(
       headers: {
         'Authorization':'Bearer ${SharedPrefs().token}'
       }
     )
   );
   if(response.statusCode==200){
  AllUsersModel   users=AllUsersModel.fromJson((response.data));
  print(users.data.length);
  print(users);
     return users;

   }else{
     throw ServerException();
   }


  }
}