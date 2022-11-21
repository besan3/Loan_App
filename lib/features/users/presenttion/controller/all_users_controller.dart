import 'package:get/get.dart';
import 'package:loan_app/core/errors/exceptions.dart';
import 'package:loan_app/features/users/data/models/all_users_model.dart';
import 'package:loan_app/features/users/data/repositories/all_users_repositoryImp.dart';
import 'package:loan_app/features/users/domain/usecases/get_all_users_usecase.dart';

class AllUsersController extends GetxController{
final GetAllUsersUseCase? getAllUsersUseCase;
final AllUsersRepositoryImp? usersModel;
final AllUsersModel? allUsersModel;
AllUsersController({required this.getAllUsersUseCase,this.usersModel,this.allUsersModel});


  @override
  void onInit() {
   getUsers();
  }
  @override
  void onReady() {
 //  getUsers();
  }

   getUsers()async{
var response= await getAllUsersUseCase?.call();
print(response);
response?.fold((l) => response, (r) => ServerException());
update();
  }



}