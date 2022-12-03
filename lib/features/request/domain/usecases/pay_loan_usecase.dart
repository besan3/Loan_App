import 'package:dartz/dartz.dart';
import 'package:loan_app/features/request/domain/entities/pay_loan_entity.dart';
import 'package:loan_app/features/request/domain/repositories/payment_repository.dart';
import 'package:loan_app/features/transactions/domain/repositories/transactions_repository.dart';

import '../../../../core/errors/fauilers.dart';

class PayLoanUseCase{
  PaymentRepository paymentRepository;
  PayLoanUseCase({required this.paymentRepository});

  Future<Either<Failure,PaymentEntity>> call(String phone,String amount,String note){
    return paymentRepository.PayLoan(phone, amount, note);

  }


}