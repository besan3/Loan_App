import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:loan_app/core/network/network_info.dart';
import 'package:loan_app/features/edit_profile/data/datasources/edit_profile_remote_data_source.dart';
import 'package:loan_app/features/edit_profile/data/repositories/edit_profile_repositoryImp.dart';
import 'package:loan_app/features/edit_profile/domain/repositories/edit_profile-repository.dart';
import 'package:loan_app/features/edit_profile/domain/usecases/edit_profile_usecase.dart';
import 'package:loan_app/features/edit_profile/presenttion/controller/edit_profile_controller.dart';

class EditProfileBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<EditProfileUseCase>(() => EditProfileUseCase(repository: Get.find()));
    Get.lazyPut<EditProfileRepository>(() => EditProfileRepositpryImp(remoteDataSource: Get.find(),networkInfo: Get.find()));
    Get.lazyPut<EditProfileRemoteDataSource>(() => EditProfileRemoteImp(dio: Get.find()));
    Get.put(EditProfileController(editProfileUseCase:Get.find()));

  }

}