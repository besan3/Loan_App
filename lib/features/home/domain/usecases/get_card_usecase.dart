import 'package:dartz/dartz.dart';
import 'package:loan_app/features/home/domain/repositories/card_repository.dart';

import '../../../../core/errors/fauilers.dart';
import '../entities/card_entity.dart';

class GetCardDataUseCase{
  CardRepository cardRepository;
  GetCardDataUseCase({required this.cardRepository});
  Future<Either<Failure,CardEntity>> call() {
   return cardRepository.getCardData();
  }

}