import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:loan_app/core/errors/fauilers.dart';
import 'package:loan_app/features/home/data/datasources/card_remote_data_source.dart';
import 'package:loan_app/features/home/domain/entities/card_entity.dart';
import 'package:loan_app/features/home/domain/repositories/card_repository.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/cache_helper.dart';
import '../../../../core/network/network_info.dart';

class CardRepositoryImp implements CardRepository{
  CardRemoteDataSource cardRemoteDataSource;
  final NetworkInfo networkInfo;
  CardRepositoryImp({required this.cardRemoteDataSource,required this.networkInfo});
  @override
  Future<Either<Failure, CardEntity>> getCardData()async {
    if(await networkInfo.isConnected){
      try{
        final response=await cardRemoteDataSource.getCardData();
        SharedPrefs().cacheCard(response);

        return Right(response);
      }on DioError{
        return Left(ServerFailure());
      }
    }else{
      try {
        final localCard = await SharedPrefs().getCachedCard() ;
        //usersLocalDataSource.getCachedUsers()
        return Right(localCard);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }


}