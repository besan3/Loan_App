import 'package:dio/dio.dart';
import 'package:loan_app/core/network/end_points.dart';
import 'package:loan_app/features/auth/data/models/request_code_model.dart';
import 'package:loan_app/features/auth/data/models/setup_model.dart';
import 'package:loan_app/features/auth/data/models/verifivation_model.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/network/cache_helper.dart';

abstract class AuthRemoteDataSource {
  Future<RequestCodeModel> requestCode({required String phone_number});

  Future<LoginModel> logIn({
    required String phone_number,
    required String code,
  });

  Future<SetUpModel> SetUp({
    required String phoneNumber,
    required String firstName,
    required String lastName,
    required String email,
    required String dateOfBirth,
    required String addressLine1,
    required String addressLine2,
    required String address,
    required String image,
  });
}

class AuthRemoteImp implements AuthRemoteDataSource {
  Dio dio;

  AuthRemoteImp({required this.dio});

  @override
  Future<RequestCodeModel> requestCode({
    required String phone_number,
  }) async {
    var response =
        await dio.post(EndPoints.REQUEST, data: {'phone_number': phone_number});
    if (response.statusCode == 200) {
      RequestCodeModel codeModel = RequestCodeModel.fromJson(response.data);
      print(codeModel);
      return codeModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<LoginModel> logIn(
      {required String phone_number, required String code}) async {
    var response =
        await dio.post(EndPoints.LOGIN, data: {'phone_number': phone_number});
    if (response.statusCode == 200) {
      LoginModel loginModel = LoginModel.fromJson(response.data);

      print(loginModel);
      return loginModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SetUpModel> SetUp(
      {required String phoneNumber,
      required String firstName,
      required String lastName,
      required String email,
      required String dateOfBirth,
      required String addressLine1,
      required String addressLine2,
      required String address,
      required String image}) async {
    var response = await dio.post(EndPoints.SIGNUP, data: {
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'date_of_birth': dateOfBirth,
      'address_line1': addressLine1,
      'address_line2': addressLine2,
      'address': address,
      'image': image,
    },
        options: Options(
            headers: {
              'Authorization':'Bearer ${SharedPrefs().token}'
            }
        )
    );
    if (response.statusCode == 200) {
      SetUpModel setUpModel = SetUpModel.fromJson(response.data);

      print(setUpModel);
      return setUpModel;
    } else {
      throw ServerException();
    }
  }
}
