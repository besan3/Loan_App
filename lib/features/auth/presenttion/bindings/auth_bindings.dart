import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loan_app/core/network/network_info.dart';
import 'package:loan_app/features/auth/data/datasources/local_data_source.dart';
import 'package:loan_app/features/auth/data/datasources/remote_data_sources.dart';
import 'package:loan_app/features/auth/data/repositories/auth_repositoryImp.dart';
import 'package:loan_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:loan_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:loan_app/features/auth/domain/usecases/request_code_usecase.dart';
import 'package:loan_app/features/auth/domain/usecases/setup_usecase.dart';
import 'package:loan_app/features/auth/presenttion/controller/login_controller.dart';
import 'package:loan_app/features/auth/presenttion/controller/setup_controller.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthRemoteImp(dio: Get.find()));
    Get.lazyPut<AuthRemoteDataSource>(()=>AuthRemoteImp(dio: Get.find()));
    Get.lazyPut<AuthLocalDataSource>(()=>AuthLocalImp());
    Get.lazyPut<AuthRepository>(()=>AuthRepositoryImp(
        authLocalDataSource:Get.find(),
        authRemoteDataSource: Get.find(), networkInfo: Get.find()
    ));
    Get.lazyPut(() => RequestCodeUseCase(authRepository: Get.find()));
    Get.lazyPut(() => LoginUseCase(authRepository: Get.find()));
    Get.lazyPut(() => SetUpUseCase(authRepository: Get.find()));
    Get.put(
      LogInController(
        requestCodeUseCase: Get.find(),
        loginUseCase: Get.find()
      ),
    );
    Get.put(
      SetUpController(
          setUpUseCase: Get.find(),
          ),

      );
  }
}
