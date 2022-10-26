import 'package:get/get.dart';

import '../transilations/arabic.dart';
import '../transilations/english.dart';


class MyLocal implements Translations{
  @override

  Map<String, Map<String, String>> get keys => {
    'en':en,
    'ar':ar



  };

}