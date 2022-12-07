import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/features/auth/presenttion/bindings/auth_bindings.dart';
import 'package:loan_app/features/edit_profile/presenttion/bindings/edit_profile_binding.dart';
import 'package:loan_app/features/users/presenttion/binding/all_users_binding.dart';
import 'package:loan_app/features/users/presenttion/controller/all_users_controller.dart';
import 'package:loan_app/core/app_sizes/app_sizes.dart';
import 'package:loan_app/core/network/cache_helper.dart';
import 'package:loan_app/core/local/local.dart';
import 'package:loan_app/core/network/end_points.dart';
import 'package:loan_app/core/routes/routes.dart';
import 'package:loan_app/core/themes/themes.dart';

import 'features/profile/setting/presenttion/controllers/setting_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  bool? isSaved=SharedPrefs.getDta( key: 'onBoarding');
 // EndPoints.token=SharedPrefs.getString( 'token').toString();
  String? startWidget;
  if(isSaved!=null){
    if(EndPoints.token!=null) {
      startWidget = RoutesClass.getLayoutRoute();
    }else {
      startWidget=RoutesClass.getLoginRoute();
    }
  }else {
    startWidget=RoutesClass.getOnboardingRoute();
  }



  runApp(  MyApp(isSaved));
  SettingController().onInit();
}

class MyApp extends StatelessWidget {
  bool? isSaved;

  MyApp(this.isSaved);
  @override
  Widget build(BuildContext context) {
    SettingController localController=Get.put(SettingController());
    localController.getAppThemeMode();

    return ScreenUtilInit(
       designSize: const Size(AppSizes.screenWidth, AppSizes.screenHeight),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
      (context , child)=> GetMaterialApp(
        initialBinding: MainBinding(),
        debugShowCheckedModeBanner: false,
     locale: localController.initialLang,
        translations: MyLocal(),
        title: 'Loan Application',
        theme: AppThemes().CustomLightTheme,
       darkTheme: AppThemes().CustomDarkTheme,
       themeMode: localController.themeMode,
       initialRoute: isSaved!=true?RoutesClass.onboarding:RoutesClass.login,
        getPages: RoutesClass().routes,

      ),
    );
  }
}

