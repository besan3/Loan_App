import 'package:dio/dio.dart';
import 'package:loan_app/features/request/data/models/payment_model.dart';
import 'package:loan_app/features/request/domain/entities/pay_loan_entity.dart';
import 'package:loan_app/features/transactions/data/models/transaction_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/cache_helper.dart';
import '../../../../core/network/end_points.dart';

abstract class PaymentRemoteDataSource {
  Future<PaymentEntity>payLoan(String phone, String amount,String note);

}

class PaymentRemoteImp implements PaymentRemoteDataSource{
  Dio dio;
  PaymentRemoteImp({required this.dio});

  @override
  Future<PaymentEntity> payLoan(String phone, String amount, String note)async {
    var response=await dio.post(EndPoints.PAYMENT,
    data: {
      'phone':phone,
      'amount':amount,
      'note':note
    },
        options: Options(
            headers: {
              'Authorization':'Bearer ${SharedPrefs().token}'
            }
        )
    );

    if (response.statusCode == 200) {
      PaymentModel paymentModel = PaymentModel.fromJson(response.data);
      print(paymentModel);
      return paymentModel;
    } else {
      throw ServerException();
    }
  }


}