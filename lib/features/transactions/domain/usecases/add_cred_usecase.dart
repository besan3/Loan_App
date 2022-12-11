import 'package:dartz/dartz.dart';
import 'package:loan_app/features/transactions/domain/repositories/transactions_repository.dart';

import '../../../../core/errors/fauilers.dart';
import '../entities/transaction_entity.dart';

class TransactionCrUseCase{
  TransactionsRepository transactionsRepository;
  TransactionCrUseCase({required this.transactionsRepository});

  Future<Either<Failure,TransactionEntity>> call(String phone,String amount,String deadline,String note){
    return transactionsRepository.transactionCr(phone, amount, deadline, note);

  }


}