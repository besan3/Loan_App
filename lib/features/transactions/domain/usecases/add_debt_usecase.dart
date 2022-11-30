import 'package:dartz/dartz.dart';
import 'package:loan_app/features/transactions/domain/repositories/transactions_repository.dart';

import '../../../../core/errors/fauilers.dart';
import '../entities/transaction_entity.dart';

class TransactionUseCase{
TransactionsRepository transactionsRepository;
TransactionUseCase({required this.transactionsRepository});

Future<Either<Failure,TranactionEntity>> call(String phone,String amount,String deadline,String note){
return transactionsRepository.transaction(phone, amount, deadline, note);

}


}