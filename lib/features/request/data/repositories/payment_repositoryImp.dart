import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loan_app/core/errors/fauilers.dart';
import 'package:loan_app/features/request/data/datasources/payment_remote_data_source.dart';
import 'package:loan_app/features/request/domain/entities/pay_loan_entity.dart';
import 'package:loan_app/features/request/domain/repositories/payment_repository.dart';
import 'package:loan_app/features/transactions/data/dataresoueces/transaction_remote_data_source.dart';
import 'package:loan_app/features/transactions/data/models/transaction_model.dart';
import 'package:loan_app/features/transactions/domain/entities/transaction_entity.dart';
import 'package:loan_app/features/transactions/domain/repositories/transactions_repository.dart';

import '../../../../core/network/network_info.dart';

class PaymentRepositoryImp implements PaymentRepository{
  final NetworkInfo networkInfo;
  final PaymentRemoteDataSource paymentRemoteDataSource;
  PaymentRepositoryImp({required this.paymentRemoteDataSource,required this.networkInfo});


  @override
  Future<Either<Failure, PaymentEntity>> PayLoan(String phone, String amount, String note)async {
    if(await networkInfo.isConnected){
      try{
        final response=await paymentRemoteDataSource.payLoan(phone, amount, note);

        return Right(response);
      }on DioError{
        return Left(ServerFailure());
      }
    }


    return Left(ConnectionFailure());
  }



}