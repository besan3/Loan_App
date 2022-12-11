import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loan_app/core/errors/fauilers.dart';
import 'package:loan_app/core/network/cache_helper.dart';
import 'package:loan_app/core/network/network_info.dart';
import 'package:loan_app/features/users/data/datasources/all_users_remote_data_source.dart';
import 'package:loan_app/features/users/domain/repositories/all_users_repository.dart';

import '../../../../core/errors/exceptions.dart';
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
        SharedPrefs().cacheUsers(response);
       usersLocalDataSource.cacheUsers(response);
        return Right(response);
      }on DioError{
        return Left(ServerFailure());
      }
    }else{
      try {
        final localUsers = await SharedPrefs().getCachedUsers() ;
        //usersLocalDataSource.getCachedUsers()
        return Right(localUsers);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }


  }




}