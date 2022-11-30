import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:loan_app/core/errors/fauilers.dart';
import '../entities/all_users.dart';
import '../repositories/all_users_repository.dart';
import 'package:loan_app/core/usecases/usecases.dart';

class GetAllUsersUseCase implements MainUseCase<AllUsers,NoParams>{

  late AllUsersRepository repository;

  GetAllUsersUseCase({required this.repository});

  Future<Either<Failure, AllUsers>> call(NoParams noParams) async{
    return await repository.getAllUsers();
  }

}
