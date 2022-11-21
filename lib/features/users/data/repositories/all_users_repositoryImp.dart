import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loan_app/core/errors/fauilers.dart';
import 'package:loan_app/core/network/network_info.dart';
import 'package:loan_app/features/users/data/datasources/all_users_remote_data_source.dart';
import 'package:loan_app/features/users/domain/repositories/all_users_repository.dart';

import '../../domain/entities/all_users.dart';
import '../datasources/all_users_local_datasource.dart';

class AllUsersRepositoryImp implements AllUsersRepository{
  final AllUsersLocalDataSource usersLocalDataSource;
  final AllUsersRemoteDataSource usersRemoteDataSource;
  final NetworkInfo networkInfo;
  AllUsersRepositoryImp(
      {
       required this.usersLocalDataSource,
      required this.usersRemoteDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, AllUsers>> getAllUsers()async {
    if(await networkInfo.isConnected){
      try{
        final response=await usersRemoteDataSource.getAllUsers();
      // usersLocalDataSource.cacheUsers(response);
        return Right(response);
      }on DioError{
        return Left(ServerFailure());
      }
    }


   return Left(ConnectionFailure());
  }




}