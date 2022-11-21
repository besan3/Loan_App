import 'package:get/get.dart';
import 'package:loan_app/features/edit_profile/presenttion/pages/edit_profile_screen.dart';
import 'package:loan_app/features/profile/setting/presenttion/pages/profile_settings_screen.dart';
import 'package:loan_app/core/app_images/app_images.dart';
import 'package:loan_app/core/routes/routes.dart';

import '../../../../core/app_texts/app_texts.dart';
import '../../../../core/network/cache_helper.dart';

class SettingsController extends GetxController {
  List<String> cardIcons = [
   AppImages.profileIcon,
 AppImages.debandcredIcon,
    AppImages.settingIcon,
   AppImages.logoutIcon,
  ];
  List<String> cardTitle = [
    AppTexts.personal_details.tr,
    AppTexts.deb_cred.tr,
    AppTexts.setting.tr,
   AppTexts.logout.tr
  ];

  void signOut(){
    SharedPrefs.removeData(key: 'token').then(((value){
      Get.offAllNamed(RoutesClass.getLoginRoute());
    }));
  }
  List cardScreens = [
    PersonalDetailsScreen(),
    PersonalDetailsScreen(),
    ProfileSettingScreen(),
   // ProfileSettingScreen(),
  ];


}
