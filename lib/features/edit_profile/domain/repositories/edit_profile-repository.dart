import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loan_app/features/edit_profile/domain/entities/edit_profile_entity.dart';

import '../../../../core/errors/fauilers.dart';
import '../entities/edit_profile_data.dart';

abstract class EditProfileRepository {
  Future<Either<Failure,EditProfile>> editProfile({
required String image,
required String first_name,
required String last_name,
required String email,
required String date_of_birth,
required String address,
required String address_line1,
required String address_line2,
  });



}