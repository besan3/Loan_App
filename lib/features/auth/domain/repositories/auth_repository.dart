import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loan_app/features/auth/domain/entities/login_entity.dart';
import 'package:loan_app/features/auth/domain/entities/setup_entity.dart';
import '../../../../core/errors/fauilers.dart';
import '../entities/request_code_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, RequestCodeEntity>> requestCode(String phone_number);

  Future<Either<Failure, LogInEntity>> login(String phone_number, String code);

  Future<Either<Failure, SetUpEntity>> SetUp(
      String phone_number,
      String fName,
      String lName,
      String email,
      String dob,
      String address,
      String address1,
      String address2,
   //   String image
      );
}
