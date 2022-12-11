import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loan_app/core/errors/fauilers.dart';
import 'package:loan_app/core/network/cache_helper.dart';
import 'package:loan_app/core/network/network_info.dart';
import 'package:loan_app/features/auth/data/datasources/local_data_source.dart';
import 'package:loan_app/features/auth/data/datasources/remote_data_sources.dart';
import 'package:loan_app/features/auth/domain/entities/login_entity.dart';
import 'package:loan_app/features/auth/domain/entities/setup_entity.dart';
import 'package:loan_app/features/auth/domain/repositories/auth_repository.dart';
import '../../../../core/errors/exceptions.dart';
import '../../domain/entities/request_code_entity.dart';

class AuthRepositoryImp implements AuthRepository {
  AuthRemoteDataSource authRemoteDataSource;
  AuthLocalDataSource authLocalDataSource;
  NetworkInfo networkInfo;

  AuthRepositoryImp(
      {required this.authRemoteDataSource,
      required this.authLocalDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, RequestCodeEntity>> requestCode(
      String phone_number) async {
    if (await networkInfo.isConnected) {
      try {

        final response =
            await authRemoteDataSource.requestCode(phone_number: phone_number);

        return Right(response);
      } on DioError {
        return Left(ServerFailure());
      }
    }

    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, LogInEntity>> login(
      String phone_number, String code) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await authRemoteDataSource.logIn(
            phone_number: phone_number, code: code);
        SharedPrefs().cacheLogin(response.token??'');

        // authLocalDataSource.cacheLogin(response.token??'');


        return Right(response);
      } on DioError {
        return Left(ServerFailure());
      }
    }
    // else{
    //   try {
    //     final localLogin = await authLocalDataSource.getCachedLogin();
    //     return Right(localLogin);
    //   } on EmptyCacheException {
    //     return Left(EmptyCacheFailure());
    //   }
    //}

    return Left(ConnectionFailure());
  }

  @override
  Future<Either<Failure, SetUpEntity>> SetUp(
      String phone_number,
      String fName,
      String lName,
      String email,
      String dob,
      String address,
      String address1,
      String address2,
     // String image
      ) async {
    if (await networkInfo.isConnected) {
      // try {

        final response = await authRemoteDataSource.SetUp(
            phoneNumber: phone_number,
            firstName: fName,
            lastName: lName,
            email: email,
            dateOfBirth: dob,
            addressLine1: address1,
            addressLine2: address2,
            address: address,
            //image: image
        );
        print(response);

        return Right(response);
      // } on DioError {
      //   return Left(ServerFailure());
      // }
    }

    return Left(ConnectionFailure());
  }
}
