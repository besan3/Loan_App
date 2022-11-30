import 'package:dartz/dartz.dart';
import 'package:loan_app/features/transactions/domain/entities/transaction_entity.dart';

import '../../../../core/errors/fauilers.dart';

abstract class TransactionsRepository{
  Future<Either<Failure,TranactionEntity>> transaction(String phone,String amount,String deadline,String note);



}