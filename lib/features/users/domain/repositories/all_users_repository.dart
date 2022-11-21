import 'package:dartz/dartz.dart';
import 'package:loan_app/core/errors/fauilers.dart';

import '../entities/all_users.dart';

abstract class AllUsersRepository{
 Future<Either<Failure,AllUsers>> getAllUsers();


}