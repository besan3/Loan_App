import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart' hide Response;
import 'package:image_picker/image_picker.dart';
import 'package:loan_app/features/edit_profile/data/models/edit_profile_model.dart';
import 'package:loan_app/features/edit_profile/domain/entities/edit_profile_data.dart';
import 'package:loan_app/features/edit_profile/domain/entities/edit_profile_entity.dart';
import 'package:loan_app/features/edit_profile/domain/usecases/edit_profile_usecase.dart';
import 'package:loan_app/features/users/presenttion/controller/all_users_states.dart';

import '../../../../core/colors/app_colors.dart';
import '../../../../core/errors/fauilers.dart';
import 'dart:io';

class EditProfileController extends GetxController with StateMixin{
  EditProfileUseCase editProfileUseCase;
  EditProfileController({required this.editProfileUseCase});
  EditProfile editProfileModel=EditProfile(data: EditProfileData(address: '',email: '',image: '',first_name: '',last_name: '',date_of_birth: '',address_line2: '',address_line1: '',phone_number: ''));
  TextEditingController phoneController=TextEditingController();
  TextEditingController fNameController=TextEditingController();
  TextEditingController lNameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController addressController=TextEditingController();
  TextEditingController address1Controller=TextEditingController();
  TextEditingController address2Controller=TextEditingController();
  TextEditingController dObController=TextEditingController();
  TextEditingController imageController=TextEditingController();
  late Position position;
  late DateTime dateTime;
  ImagePicker picker = ImagePicker();
  var isLoading=false.obs;

  XFile? image;
  UsersStates state=UsersStates.loading;
  @override
  void onInit() {
    getPosition();
    super.onInit();
  }
  @override
  void onClose() {
   phoneController.dispose();
   fNameController.dispose();
   lNameController.dispose();
   emailController.dispose();
   addressController.dispose();
   address1Controller.dispose();
   address2Controller.dispose();
   dObController.dispose();
   imageController.dispose();
  }
  Future getPosition()async{
    bool services;
    LocationPermission per;
    services=await Geolocator.isLocationServiceEnabled();
    if(!services){
      Get.defaultDialog(
          content: Text('Location Service not Enabled '),
          title: 'services',
          titleStyle:TextStyle(
              color: AppColors.primaryTextColor
          )
      );
    }
    print(services);
    per=await Geolocator.checkPermission();
    if(per==LocationPermission.denied){
      per=await Geolocator.requestPermission();
      if(per==LocationPermission.always||per==LocationPermission.whileInUse){
        getLatAndLang();
        /* print("latitude:${position.latitude}");
    print("longitude:${position.longitude}");*/
      }
    }
    print(per);
  }
  Future<Position> getLatAndLang()async{
    return position= await Geolocator.getCurrentPosition().then((value) {
      return value;
    });


  }
  void editProfile(
  {
    required String phone_number,
    required String first_name,
    required String last_name,
    required String email,
    required String address_line1,
    required String address_line2,
    required String address,
    required String image,
    required String date_of_birth,

  }
      )async{
    isLoading(true);
    var response=await editProfileUseCase.call(image: image, first_name: first_name, last_name: last_name, email: email, date_of_birth: date_of_birth, address: address, address_line1: address_line1, address_line2: address_line2);
    isLoading(false);
response.fold((l) {
  ConnectionFailure();
  Get.snackbar('status', 'fail',backgroundColor: Colors.red);
  }, (r) {
  editProfileModel=r;
  state=UsersStates.success;

  Get.snackbar('status', 'success');
});
    print(response);


  }
final imagepicker=ImagePicker();
  Future pickImg()async{

      image = await imagepicker.pickImage(source: ImageSource.gallery);
      if(image!=null){
        image=XFile(image!.path);
      }
update();

  }


}