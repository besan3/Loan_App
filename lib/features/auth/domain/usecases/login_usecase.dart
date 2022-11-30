import 'package:dartz/dartz.dart';
import 'package:loan_app/core/usecases/usecases.dart';
import 'package:loan_app/features/auth/domain/entities/login_entity.dart';

import '../../../../core/errors/fauilers.dart';
import '../entities/request_code_entity.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  Future<Either<Failure,LogInEntity>> call(String phone_number,String code){
    return authRepository.login(phone_number,code);

  }
}