import 'package:dio/dio.dart';
import 'package:loan_app/features/home/data/models/card_model.dart';

import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/cache_helper.dart';

abstract class CardRemoteDataSource {
  Future<CardModel> getCardData();
}

class CardRemoteImp extends CardRemoteDataSource{
  Dio dio;
  CardRemoteImp({required this.dio
  });
  @override
  Future<CardModel> getCardData() async{
    Response response=await dio.get('https://aseel.sirius-it.dev/api/near',
        options: Options(
            headers: {
              'Authorization':'Bearer ${SharedPrefs().token}'
            }
        )
    );
    if(response.statusCode==200){
      CardModel   cardModel=CardModel.fromJson((response.data));
      print(cardModel.data.toString());
      print(cardModel);
      return cardModel;

    }else{
      throw ServerException();
    }


  }
  }


