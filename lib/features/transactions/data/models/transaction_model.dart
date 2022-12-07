import 'package:loan_app/features/transactions/domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionEntity{
  TransactionModel({required super.success,required super.message});
  factory TransactionModel.fromJson(Map<String,dynamic>json){
    return TransactionModel(success: json['success'],
message: json['message']
);
}

Map<String, dynamic> toJson() {

    return {'success': success as String,
    'message':message
    };
}
}