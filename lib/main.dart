import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/profile/setting/controller/setting_controller.dart';
import 'package:loan_app/resources/app_sizes/app_sizes.dart';
import 'package:loan_app/resources/network/local/cache_helper.dart';
import 'package:loan_app/resources/local/local.dart';
import 'package:loan_app/resources/network/remote/end_points.dart';
import 'package:loan_app/resources/routes/routes.dart';
import 'package:loan_app/resources/themes/themes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefs().init();
  bool? isSaved=SharedPrefs.getDta( key: 'onBoarding');
  EndPoints.token=SharedPrefs.getString( 'token').toString();
  String? startWidget;
  if(isSaved!=null){
    if(EndPoints.token!=null) {
      startWidget = RoutesClass.getLayoutRoute();
    }else startWidget=RoutesClass.getLoginRoute();
  }else startWidget=RoutesClass.getOnboardingRoute();



  runApp(  MyApp(startWidget));
  SettingController().onInit();
}

class MyApp extends StatelessWidget {
  String? startWidget;

  MyApp(this.startWidget);
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
        debugShowCheckedModeBanner: false,
     locale: localController.initialLang,
        translations: MyLocal(),
        title: 'Loan Application',
        theme: AppThemes().CustomLightTheme,
       darkTheme: AppThemes().CustomDarkTheme,
       themeMode: localController.themeMode,
       initialRoute: startWidget,
        getPages: RoutesClass().routes,

      ),
    );
  }
}

