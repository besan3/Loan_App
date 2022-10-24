
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loan_app/modules/profile/setting/controller/setting_controller.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/themes/themes.dart';
import 'package:loan_app/shared/local/local.dart';
import 'package:loan_app/shared/network/local/cache_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences?  sharepref;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  sharepref=await CacheHelper.init();
  await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
 const  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SettingController localController=Get.put(SettingController(),permanent: true);
    return ScreenUtilInit(
       designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
      (context , child)=> GetMaterialApp(
        debugShowCheckedModeBanner: false,
        locale: localController.initialLang,
        translations: MyLocal(),
        title: 'Loan Application',
        theme:
        
        
        

      AppThemes.CustomLightTheme,
       darkTheme: AppThemes.CustomDarkTheme,
       themeMode:localController.getThemeMode(),
    
        

       initialRoute:RoutesClass.getSplashRout() ,
        getPages:
          RoutesClass().routes
        ,
    //    home: SplashScreen(),
      ),
    );
  }
}

