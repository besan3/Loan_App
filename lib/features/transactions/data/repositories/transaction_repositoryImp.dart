import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loan_app/core/errors/fauilers.dart';
import 'package:loan_app/features/transactions/data/dataresoueces/transaction_remote_data_source.dart';
import 'package:loan_app/features/transactions/data/models/transaction_model.dart';
import 'package:loan_app/features/transactions/domain/entities/transaction_entity.dart';
import 'package:loan_app/features/transactions/domain/repositories/transactions_repository.dart';

import '../../../../core/network/network_info.dart';

class TransactionRepositoryImp implements TransactionsRepository{
  final NetworkInfo networkInfo;
  final TransactionRemoteDataSource transactionRemoteDataSource;
  TransactionRepositoryImp({required this.transactionRemoteDataSource,required this.networkInfo});

  @override
  Future<Either<Failure, TranactionEntity>> transaction(String phone, String amount, String deadline, String note)async {
    if(await networkInfo.isConnected){
      try{
        final response=await transactionRemoteDataSource.transaction(phone, amount, deadline, note);

        return Right(response);
      }on DioError{
        return Left(ServerFailure());
      }
    }


    return Left(ConnectionFailure());
  }



}