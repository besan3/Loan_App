import 'package:dartz/dartz.dart';
import 'package:loan_app/features/auth/domain/entities/setup_entity.dart';

import '../../../../core/errors/fauilers.dart';
import '../repositories/auth_repository.dart';

class SetUpUseCase {
  AuthRepository authRepository;

  SetUpUseCase({required this.authRepository});

  Future<Either<Failure, SetUpEntity>> call(
      String phone_number,
      String fName,
      String lName,
      String email,
      String dob,
      String address,
      String address1,
      String address2,
      String image
      ) {
    return authRepository.SetUp(phone_number, fName, lName, email, dob, address,
        address1, address2, image);
  }
}
