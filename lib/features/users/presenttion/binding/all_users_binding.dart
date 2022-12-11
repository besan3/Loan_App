import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loan_app/features/home/data/datasources/card_remote_data_source.dart';
import 'package:loan_app/features/home/data/repositories/card_repositoryImp.dart';
import 'package:loan_app/features/home/domain/repositories/card_repository.dart';
import 'package:loan_app/features/home/domain/usecases/get_card_usecase.dart';
import 'package:loan_app/features/users/data/models/all_users_model.dart';
import 'package:loan_app/features/users/data/repositories/all_users_repositoryImp.dart';
import 'package:loan_app/features/users/domain/entities/all_users_data.dart';
import 'package:loan_app/features/users/domain/repositories/all_users_repository.dart';
import 'package:loan_app/features/users/domain/usecases/get_all_users_usecase.dart';
import 'package:loan_app/features/users/presenttion/controller/all_users_controller.dart';

import '../../../../core/network/network_info.dart';
import '../../data/datasources/all_users_local_datasource.dart';
import '../../data/datasources/all_users_remote_data_source.dart';

class AllUsersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AllUsersLocalDataSource>(()=>UsersLocalDataSource());
    Get.lazyPut<AllUsersRemoteDataSource>(()=>UsersRemoteDataSource(dio: Get.find()));
    Get.lazyPut<CardRemoteDataSource>(()=>CardRemoteImp(dio: Get.find()));
    Get.lazyPut<AllUsersRepository>(()=>
        AllUsersRepositoryImp(
        usersLocalDataSource: Get.find(),
        usersRemoteDataSource: Get.find(),
        networkInfo: Get.find()
    )
    );
    Get.lazyPut<CardRepository>(()=>
        CardRepositoryImp(
        cardRemoteDataSource: Get.find(),
        networkInfo: Get.find()
    )
    );

    Get.put<Dio>(Dio());
    Get.put<InternetConnectionChecker>(InternetConnectionChecker());
    Get.put<NetworkInfo>(NetworkInfoImp(connectionChecker: Get.find()));
    Get.lazyPut(() => GetAllUsersUseCase(
          repository: Get.find(),
        ));
    Get.lazyPut(() => GetCardDataUseCase(
     cardRepository: Get.find(),
    ));
    Get.put<AllUsersController>(
        AllUsersController(getAllUsersUseCase: Get.find<GetAllUsersUseCase>(), getCardDataUseCase: Get.find<GetCardDataUseCase>()));
  }
}

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Dio>(Dio());
    Get.put<InternetConnectionChecker>(InternetConnectionChecker());
    Get.put<NetworkInfo>(NetworkInfoImp(connectionChecker: Get.find()));
  }
}
