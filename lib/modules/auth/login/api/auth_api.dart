import 'package:dio/dio.dart';
import 'package:get/get.dart'hide Response;
import 'package:loan_app/modules/auth/repositories/auth_repository.dart';

import '../../../../resources/network/local/cache_helper.dart';
import '../../../../resources/network/remote/end_points.dart';
import '../../../../resources/routes/routes.dart';
import '../../logout/logout_model.dart';

class AuthApi extends AuthRepository{
  Dio dio=Dio();
  @override
  Future<Response> postData({
  required String phoneNumber
}) async{
    var response = await dio.post( EndPoints.REQUEST,

        data: {
          'phone_number': phoneNumber,

        },

    ) ;

return response;
  }

  @override
  Future<Response>  login(
      {required String phoneNumber,
        required String code}
        ) async{
    var response= await dio.post(EndPoints.LOGIN, data:{
     'phone_number':phoneNumber,
     'code':code

   });
    return response;
  }
Future<LogOutModel> logOut()async{
    var response=await dio.get(EndPoints.LOGOUT);

    LogOutModel logOutModel=LogOutModel.fromJson(response.data);
    SharedPrefs.removeData(key: 'token').then(((value){
      Get.offAllNamed(RoutesClass.getLoginRoute());
    }));
    return logOutModel;

}

}