import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:loan_app/core/app_texts/app_texts.dart';
import 'package:loan_app/core/errors/exceptions.dart';
import 'package:loan_app/core/errors/fauilers.dart';
import 'package:loan_app/core/usecases/usecases.dart';
import 'package:loan_app/features/users/data/models/all_users_model.dart';
import 'package:loan_app/features/users/data/repositories/all_users_repositoryImp.dart';
import 'package:loan_app/features/users/domain/entities/all_users.dart';
import 'package:loan_app/features/users/domain/entities/all_users_data.dart';
import 'package:loan_app/features/users/domain/usecases/get_all_users_usecase.dart';
import 'package:loan_app/features/users/presenttion/controller/all_users_states.dart';

import '../../../../core/states/views_states.dart';

class AllUsersController extends GetxController with StateMixin<AllUsersModel>{
final GetAllUsersUseCase? getAllUsersUseCase;
AllUsersModel allUsersModel=AllUsersModel(data: []);
ViewState<AllUsersModel> viewState =
ViewState(state: ResponseState.empty);
AllUsersController({required this.getAllUsersUseCase});
UsersStates intialState=UsersStates.loading;
void setViewState(ViewState<AllUsersModel> viewState) {
  this.viewState = viewState;
  update();
}
  @override
  void onInit() {
   getUsers();
  }
  @override
  void onReady() {
 //  getUsers();
  }
int index=0;
NoParams noParams=NoParams();
  Future getUsers()async{
  //setViewState(ViewState.loading());
    change(allUsersModel,status: RxStatus.loading());
var response= await getAllUsersUseCase?.call(noParams);

print(response);
response?.fold((l) {ConnectionFailure();
//setViewState(ViewState.error(l.toString()));

change(allUsersModel,status: RxStatus.error());
} , (r) {

  allUsersModel.data =r.data;

  //setViewState(ViewState.complete());
 update();
    change(allUsersModel,status: RxStatus.success());


} );
//update();
  }



}