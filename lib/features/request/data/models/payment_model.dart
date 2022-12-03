import 'package:loan_app/features/request/domain/entities/pay_loan_entity.dart';
import 'package:loan_app/features/transactions/domain/entities/transaction_entity.dart';

class PaymentModel extends PaymentEntity{
  PaymentModel({required super.message, required super.success});


factory PaymentModel.fromJson(Map<String,dynamic>json){
return PaymentModel(
    message:json['message'],
    success: json['success']
);
}

Map<String, dynamic> toJson() {

  return {'success': success as String};
}
}