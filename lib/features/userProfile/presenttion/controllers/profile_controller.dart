import 'package:get/get.dart';

import '../../../../core/app_texts/app_texts.dart';

class ProfileController extends GetxController{
  List<String> profileInfoTitels = [
    AppTexts.name,
    AppTexts.email,
    AppTexts.dOb,
    AppTexts.odb,
    AppTexts.location
  ];

  List<String> profileInfo= [
    AppTexts.username,
    ' johndoe@example.con ',
    '+12 345 67890',
    '23 February 1996',
    'Gaza'
  ];
}