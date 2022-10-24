import 'package:get/get.dart';
import 'package:loan_app/shared/transilations/english.dart';

import '../transilations/arabic.dart';


class MyLocal implements Translations{
  @override

  Map<String, Map<String, String>> get keys => {
    'en':en,
    'ar':ar



  };

}