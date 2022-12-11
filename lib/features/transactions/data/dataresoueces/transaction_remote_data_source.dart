import 'package:dio/dio.dart';
import 'package:loan_app/features/transactions/data/models/transaction_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/cache_helper.dart';
import '../../../../core/network/end_points.dart';

abstract class TransactionRemoteDataSource {
  Future<TransactionModel>transactionDr(String phone, String amount, String deadline, String note);
  Future<TransactionModel>transactionCr(String phone, String amount, String deadline, String note);

}

class TransactionRemoteImp implements TransactionRemoteDataSource{
  Dio dio;
  TransactionRemoteImp({required this.dio});
  @override
  Future<TransactionModel> transactionDr(String phone, String amount, String deadline, String note) async{
    var response =
    await dio.post(EndPoints.DEBITOR, data: {
      'phone':phone,
      'amount':amount,
      'deadline':deadline,
      'note':note
    },
        options: Options(
            headers: {
              'Authorization':'Bearer ${SharedPrefs().token}'
            }
        ));
    if (response.statusCode == 200) {
      print(response.data.toString());
      TransactionModel transactionModel = TransactionModel.fromJson(response.data);
      print(transactionModel);
      return transactionModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<TransactionModel> transactionCr(String phone, String amount, String deadline, String note)async {
    var response =
        await dio.post(EndPoints.CREDITOR, data: {
      'phone':phone,
      'amount':amount,
      'deadline':deadline,
      'note':note
    },
        options: Options(
            headers: {
              'Authorization':'Bearer ${SharedPrefs().token}'
            }
        ));
    if (response.statusCode == 200) {
      print(response.data.toString());
      TransactionModel transactionModel = TransactionModel.fromJson(response.data);
      print(transactionModel);
      return transactionModel;
    } else {
      throw ServerException();
    }
  }


}