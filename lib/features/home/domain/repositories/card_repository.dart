import 'package:dartz/dartz.dart';
import 'package:loan_app/features/home/domain/entities/card_entity.dart';

import '../../../../core/errors/fauilers.dart';

abstract class CardRepository{
  Future<Either<Failure,CardEntity>> getCardData();


}