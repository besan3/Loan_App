
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loan_app/core/errors/fauilers.dart';
import 'package:loan_app/features/edit_profile/data/datasources/edit_profile_remote_data_source.dart';
import 'package:loan_app/features/edit_profile/data/models/edit_profile_model.dart';
import 'package:loan_app/features/edit_profile/domain/entities/edit_profile_entity.dart';
import 'package:loan_app/features/edit_profile/domain/repositories/edit_profile-repository.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/edit_profile_data.dart';

class EditProfileRepositpryImp implements EditProfileRepository{
  final EditProfileRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  EditProfileRepositpryImp({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, EditProfile>> editProfile({required String image,
    required String first_name,
    required String last_name,
    required String email,
    required String date_of_birth,
    required String address,
    required String address_line1,
    required String address_line2,})async {
   try{
     var respones=await remoteDataSource.editProfile(image: image, first_name: first_name, last_name: last_name, email: email, date_of_birth: date_of_birth, address: address, address_line1: address_line1, address_line2: address_line2);
     return Right(respones);
   }
   on BaseException{
     return Left(ConnectionFailure());
     // String errorMessage = ErrorMapper.getErrorMessage(e.httpStatusCode);
     // return Right(Failure(message: errorMessage));
   }
  }



}