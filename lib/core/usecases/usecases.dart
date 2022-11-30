import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/fauilers.dart';

abstract class MainUseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
