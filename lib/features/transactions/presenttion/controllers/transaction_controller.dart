import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loan_app/features/transactions/data/models/transaction_model.dart';
import 'package:loan_app/features/transactions/domain/usecases/add_debt_usecase.dart';

import '../../../../core/errors/fauilers.dart';
import '../../../users/presenttion/controller/all_users_states.dart';
import '../../domain/entities/transaction_entity.dart';
import '../../domain/usecases/add_cred_usecase.dart';

class TransactionController extends GetxController {
  TransactionDrUseCase transactionUseCase;
  TransactionCrUseCase transactionCrUseCase;
  //TransactionEntity transactionModel=TransactionEntity();
  TransactionController({required this.transactionUseCase,required this.transactionCrUseCase});
  TextEditingController phoneNumber=TextEditingController();
  TextEditingController deadline=TextEditingController();
  TextEditingController amount=TextEditingController();
  TextEditingController note=TextEditingController();
  late DateTime dateTime;
  var isLoading = false.obs;

  UsersStates initialState=UsersStates.loading;
  @override
  void onClose(){
    phoneNumber.dispose();
    deadline.dispose();
    amount.dispose();
    note.dispose();
  }
  changState(){
    initialState=UsersStates.success;
    update();

  }
  void transactionDr(
      {
        required String phoneNumber,
        required String deadLine,
        required String amount,
        required String note,
      }
      )async{
    isLoading(true);
    var response=await transactionUseCase.call(phoneNumber, amount, deadLine, note);
    print(response);
    isLoading(false);
    response.fold(
            (l) {
      Get.snackbar('Status','Fail');
      ConnectionFailure();

    }, (r) {
      print(response);
     /// transactionModel.success=r.success;
      Get.snackbar(r.message.toString(),r.success.toString());
     // change(transactionModel,status: RxStatus.loading());
    }
    );

}
void transactionCr(
      {
        required String phoneNumber,
        required String deadLine,
        required String amount,
        required String note,
      }
      )async{
    isLoading(true);
    var response=await transactionCrUseCase.call(phoneNumber, amount, deadLine, note);
    print(response);
    isLoading(false);
    response.fold(
            (l) {
      Get.snackbar('Status','Fail');
      ConnectionFailure();

    }, (r) {
      print(response);
     /// transactionModel.success=r.success;
      Get.snackbar(r.message.toString(),r.success.toString());
     // change(transactionModel,status: RxStatus.loading());
    }
    );
}


  }