import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/auth/setup/setup_api.dart';
import 'package:loan_app/resources/colors/app_colors.dart';

import '../../../../resources/network/remote/end_points.dart';

class SetUpController extends GetxController{
  var firstNameController=TextEditingController();
  var lastNameController=TextEditingController();
  var emailController=TextEditingController();
  var dObController=TextEditingController();
  var locationController=TextEditingController();
  var location1Controller=TextEditingController();
  var location2Controller=TextEditingController();
  Dio dio = Dio();
  SetUpApi setUpApi=SetUpApi();
  late Position position;
  late DateTime dateTime;
@override
  void onInit() {
    getPosition();
    super.onInit();
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


  void setup({
    required String firstName,
    required String lastName,
    required String email,
    required String dob,
    required String address,


  }) async {
  var response=await setUpApi.setup(firstName: firstName, lastName: lastName, email: email, dob: dob, address: address);
    if(response.statusCode ==200 ) {

      Get.snackbar('true', 'true');
      print(response);
    }else {
      Get.snackbar('Error', ' Something error ',backgroundColor: Colors.red);
    }

  }





}