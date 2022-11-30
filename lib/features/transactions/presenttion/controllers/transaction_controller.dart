import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loan_app/features/transactions/data/models/transaction_model.dart';
import 'package:loan_app/features/transactions/domain/usecases/add_debt_usecase.dart';

import '../../../../core/errors/fauilers.dart';

class TransactionController extends GetxController{
  TransactionUseCase transactionUseCase;
  TransactionModel transactionModel=TransactionModel(success: false);
  TransactionController({required this.transactionUseCase});
  TextEditingController phoneNumber=TextEditingController();
  TextEditingController deadline=TextEditingController();
  TextEditingController amount=TextEditingController();
  TextEditingController note=TextEditingController();
  late DateTime dateTime;

  void transaction(
      {
        required String phoneNumber,
        required String deadLine,
        required String amount,
        required String note,
      }
      )async{
    var response=await transactionUseCase.call(phoneNumber, amount, deadLine, note);
    print(response);
    response.fold((l) {
      Get.snackbar('Status','Fail');
      ConnectionFailure();

      // change(requestCodeModel,status: RxStatus.loading());
    }, (r) {
      print(response);
      transactionModel.success=r.success;
      Get.snackbar('Status','success');



    });

}}