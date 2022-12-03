import 'package:dartz/dartz.dart';
import 'package:loan_app/features/request/domain/entities/pay_loan_entity.dart';
import 'package:loan_app/features/transactions/domain/entities/transaction_entity.dart';

import '../../../../core/errors/fauilers.dart';

abstract class PaymentRepository{
  Future<Either<Failure,PaymentEntity>> PayLoan(String phone,String amount,String note);



}