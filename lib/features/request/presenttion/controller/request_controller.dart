import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/features/request/data/models/payment_model.dart';
import 'package:loan_app/features/request/domain/entities/pay_loan_entity.dart';
import 'package:loan_app/features/request/domain/usecases/pay_loan_usecase.dart';

import '../../../../core/errors/fauilers.dart';
import '../../api/request_api.dart';

class RequestController extends GetxController{
  TextEditingController phoneNumber=TextEditingController();
  TextEditingController deadline=TextEditingController();
  TextEditingController amount=TextEditingController();
  TextEditingController note=TextEditingController();
  PayLoanUseCase payLoanUseCase;
  PaymentEntity paymentModel=PaymentEntity(message: '', success: false);
  RequestController({ required this.payLoanUseCase});
late DateTime dateTime;
bool isLoading=false;
  startLoading() {
    isLoading = true;
    update();
  }

  endLoading() {
    isLoading = false;
    update();
  }
  void pay({
    required String phone,

    required String amount,
    required String note,
  })async{
    startLoading();
    var response=await payLoanUseCase.call(phone, amount, note);
    print(response);
    response.fold(
            (l) {
              endLoading();
          Get.snackbar('Status',paymentModel.message);
          ConnectionFailure();

        }, (r) {
      endLoading();
      print(response);
      // paymentModel.success=r.success;
      // paymentModel.message=r.message;
      Get.snackbar('Status',r.message);
    }
    );endLoading();
  }

}