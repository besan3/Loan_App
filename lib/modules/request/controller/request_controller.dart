import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/request/api/request_api.dart';

class RequestController extends GetxController{
  TextEditingController phoneNumber=TextEditingController();
  TextEditingController deadline=TextEditingController();
  TextEditingController amount=TextEditingController();
  TextEditingController note=TextEditingController();
RequestApi requestApi=RequestApi();
late DateTime dateTime;
void addDebitor({
  required String phoneNumber,
  required String deadLine,
  required String amount,
  required String note,
})async{
 var response=await requestApi.addDebitor(phoneNumber: phoneNumber, deadLine: deadLine, amount: amount, note: note) ;
 if(response.statusCode==200){
   Get.snackbar('Add Debtor', 'success');
 }
  else{
   Get.snackbar('Add Debtor', 'failed',backgroundColor: Colors.red);

 }
}


}