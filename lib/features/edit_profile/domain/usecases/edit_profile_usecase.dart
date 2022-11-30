import 'package:dartz/dartz.dart';
import 'package:dio/src/response.dart';
import 'package:loan_app/core/usecases/usecases.dart';
import 'package:loan_app/features/edit_profile/domain/entities/edit_profile_data.dart';
import 'package:loan_app/features/edit_profile/domain/entities/edit_profile_entity.dart';
import 'package:loan_app/features/edit_profile/domain/repositories/edit_profile-repository.dart';

import '../../../../core/errors/fauilers.dart';

class EditProfileUseCase{

  late EditProfileRepository repository;

  EditProfileUseCase({required this.repository});

  Future<Either<Failure, EditProfile>> call(
  {
    required String image,
    required String first_name,
    required String last_name,
    required String email,
    required String date_of_birth,
    required String address,
    required String address_line1,
    required String address_line2,
    // required Map<String,dynamic>data
  }
      ) async{
    return await repository.editProfile(image: image, first_name: first_name, last_name: last_name, email: email, date_of_birth: date_of_birth, address: address, address_line1: address_line1, address_line2: address_line2);
  }



}