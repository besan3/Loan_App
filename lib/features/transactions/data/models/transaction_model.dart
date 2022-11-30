import 'package:loan_app/features/transactions/domain/entities/transaction_entity.dart';

class TransactionModel extends TranactionEntity{
  TransactionModel({required super.success});
  factory TransactionModel.fromJson(Map<String,dynamic>json){
    return TransactionModel(success: json['success']);
}

Map<String, dynamic> toJson() {

    return {'success': success as String};
}
}