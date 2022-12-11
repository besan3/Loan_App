import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:loan_app/core/colors/app_colors.dart';
import 'package:loan_app/features/auth/data/models/setup_model.dart';
import 'package:loan_app/features/auth/domain/entities/setup_entity.dart';
import 'package:loan_app/features/auth/domain/usecases/setup_usecase.dart';
import 'package:loan_app/features/layout/presenttion/pages/layout.dart';
import 'package:loan_app/features/users/presenttion/binding/all_users_binding.dart';
import '../../../../core/errors/fauilers.dart';
import '../../../../core/routes/routes.dart';

class SetUpController extends GetxController {
  SetUpUseCase setUpUseCase;
  static SetUpController get to =>Get.find();
  SetUpController({required this.setUpUseCase});

  SetUpEntity setUpModel = SetUpEntity(
      data: SetUpData(
          image: '',
          email: '',
          address: '',
          addressLine1: '',
          addressLine2: '',
          dateOfBirth: '',
          firstName: '',
          lastName: '',
          phoneNumber: ''));
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var dObController = TextEditingController();
  var locationController = TextEditingController();
  var location1Controller = TextEditingController();
  var location2Controller = TextEditingController();
  Dio dio = Dio();
  late Position position;
  late DateTime dateTime;
  bool isLoading = false;

  @override
  void onInit() {
    getPosition();
    super.onInit();
  }

  @override
  void onClose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    dObController.dispose();
    locationController.dispose();
    location1Controller.dispose();
    location2Controller.dispose();

  }

  startLoading() {
    isLoading = true;
    update();
  }

  endLoading() {
    isLoading = false;
    update();
  }

  Future getPosition() async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    if (!services) {
      Get.defaultDialog(
          content: Text('Location Service not Enabled '),
          title: 'services',
          titleStyle: TextStyle(color: AppColors.primaryTextColor));
    }
    print(services);
    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.always ||
          per == LocationPermission.whileInUse) {
        getLatAndLang();
        /* print("latitude:${position.latitude}");
    print("longitude:${position.longitude}");*/
      }
    }
    print(per);
  }

  Future<Position> getLatAndLang() async {
    return position = await Geolocator.getCurrentPosition().then((value) {
      return value;
    });
  }

  void setUpAccount(
      {
        required String phoneNumber,
      required String firstName,
      required String lastName,
      required String email,
      required String dateOfBirth,
      required String addressLine1,
      required String addressLine2,
      required String address,
     // required String image
      }) async {
    // startLoading();

    var response = await setUpUseCase.call(phoneNumber, firstName, lastName,
        email, dateOfBirth, address, addressLine1, addressLine2);
    print(response);
    response.fold((l) {
      Get.snackbar('Status', 'Fail');
      ConnectionFailure();

      // change(requestCodeModel,status: RxStatus.loading());
    }, (r) {
      print(response);
      setUpModel = r;
      if (r.data == null) {
        endLoading();
        Get.snackbar('Status', 'enter required fields',
            backgroundColor: Colors.red);
      } else {
        endLoading();
        Get.snackbar('Status', 'success');
        Get.offAll(HomeLayout(),binding: AllUsersBinding());
      }
    });
    endLoading();
  }


}
