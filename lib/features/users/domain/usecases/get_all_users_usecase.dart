import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:loan_app/core/errors/fauilers.dart';
import '../entities/all_users.dart';
import '../repositories/all_users_repository.dart';

class GetAllUsersUseCase {

  late AllUsersRepository repository;

  GetAllUsersUseCase(this.repository);

  Future<Either<Failure, AllUsers>> call() async{
    return await repository.getAllUsers();
  }

}
