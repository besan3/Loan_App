import 'package:loan_app/modules/home/models/users_model.dart';

import '../../../resources/app_texts/app_texts.dart';

class HomeModel {
  String title = AppTexts.home_welcome;
  String? image;
  String? name;
  String? number;
  HomeModel({this.image, this.name, this.number});


}
