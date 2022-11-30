import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loan_app/core/network/network_info.dart';
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
    Get.lazyPut(() => AuthRemoteImp(dio: Dio()));
    Get.lazyPut(() => NetworkInfoImp(connectionChecker: Get.find()));
    Get.lazyPut(() => InternetConnectionChecker());
    Get.put<AuthRemoteDataSource>(AuthRemoteImp(dio: Dio()));
    Get.put<InternetConnectionChecker>(InternetConnectionChecker());
    Get.put<NetworkInfo>(NetworkInfoImp(connectionChecker: Get.find()));

    Get.put(AuthRepositoryImp(
        authRemoteDataSource: Get.find(), networkInfo: Get.find()));
    Get.put(
      LogInController(
        requestCodeUseCase: RequestCodeUseCase(
          authRepository: AuthRepositoryImp(
              authRemoteDataSource: AuthRemoteImp(dio: Dio()),
              networkInfo: NetworkInfoImp(connectionChecker: Get.find())),
        ),
        loginUseCase: LoginUseCase(
          authRepository:AuthRepositoryImp(
              authRemoteDataSource: AuthRemoteImp(dio: Dio()),
              networkInfo: NetworkInfoImp(connectionChecker: Get.find())),
        )
      ),
    );
    Get.put(
      SetUpController(
          setUpUseCase: SetUpUseCase(
            authRepository: AuthRepositoryImp(
                authRemoteDataSource: AuthRemoteImp(dio: Dio()),
                networkInfo: NetworkInfoImp(connectionChecker: Get.find())),
          ),

      ),
    );

  }
}
