import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/resources/colors/app_colors.dart';

import '../../../../resources/app_texts/app_texts.dart';
import '../../../../resources/local/cache_helper.dart';
enum Themes { System, Light, Dark }

enum Language { System, Arabic, English }

class SettingController extends GetxController{
  @override
  void onInit() {
getAppThemeMode();
  }
  Themes theme=Themes.Light;
 Language language=Language.English;
Locale? initialLang= SharedPrefs.getString('lang')==null?Get.deviceLocale:Locale(SharedPrefs.getString('lang')!);

late ThemeMode _themeMode;
ThemeMode get themeMode=>_themeMode;
Future<ThemeMode> getAppThemeMode()async{
 try{
   _themeMode=ThemeMode.values.firstWhere((e) => describeEnum(e)==SharedPrefs().theme);
 }
 catch(e){
   _themeMode=ThemeMode.system;

 }
  setAppThemeMode(themeMode);
   return _themeMode;

}

  Future <void> setAppThemeMode(ThemeMode themeMode)async{
    Get.changeThemeMode(themeMode);
    _themeMode=themeMode;
    update();
    await SharedPrefs().setTheme(themeMode.toString().split('.')[1]);
  }



  void changeLang(String langCode){

  Locale locale=Locale(langCode);
  SharedPrefs.setString('lang',langCode);
  Get.updateLocale(locale);
}




  void showBottomSheet(){
    Get.bottomSheet(
        StatefulBuilder(
          builder: (context, setState) => Column(
            children: [
              SizedBox(height: 20.h),
              ListTile(
                  title: Text(AppTexts.system.tr),
                  leading: Radio<Themes>(
                      activeColor: AppColors.primaryColor,
                      value: Themes.System,
                      groupValue: theme,
                      onChanged: (value) {
                        setState(
                              () {
                            theme = value!;
                            setAppThemeMode(ThemeMode.system);
                          },
                        );

                     // update();


                      })),
              ListTile(
                title: Text(AppTexts.light.tr),
                leading: Radio<Themes>(
                    value: Themes.Light,
                    groupValue: theme,
                    onChanged: (value) {

                      setState((){

                        theme = value!;

                       setAppThemeMode(ThemeMode.light);


                      });


//Get.changeThemeMode(ThemeMode.light);
                    }),
              ),
              ListTile(
                title: Text(AppTexts.dark.tr),
                leading: Radio<Themes>(
                    value: Themes.Dark,
                    groupValue: theme,
                    onChanged: (value) {

                         setState((){
                           theme = value!;
                          setAppThemeMode(ThemeMode.dark);

                         });

                    }),
              ),
            ],
          ),
        ),
        backgroundColor: Get.isDarkMode
            ?AppColors. primaryTextColor
            : Color(0xffE8F0FF),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(60.r)),),);
  }

  void showLangBottomSheet(){
    Get.bottomSheet(
        StatefulBuilder(
          builder: (context, setState) => Column(
            children: [
              SizedBox(height: 20.h),
              ListTile(
                  title: Text(AppTexts.system.tr),
                  leading: Radio<Language>(
                      activeColor: AppColors.primaryColor,
                      value: Language.System,
                      groupValue: language,
                      onChanged: (value) {
                        setState(
                              () {

                            language = value!;
                          },
                        );
                        update();
                      Get.deviceLocale;

                      })),
              ListTile(
                title: Text(AppTexts.english.tr),
                leading: Radio<Language>(
                    value: Language.English,
                    groupValue: language,
                    onChanged: (value) {
                      setState(
                            () {
                          language = value!;
                        },
                      );
                     update();
                     changeLang('en');

                    }),
              ),
              ListTile(
                title:Text(AppTexts.arabic.tr),
                leading: Radio<Language>(
                    value: Language.Arabic,
                    groupValue: language,
                    onChanged: (value) {
                      setState(
                            () {
                          language = value!;
                        },
                      );
                      update();
                      changeLang('ar');


                    }),
              ),
            ],
          ),
        ),
        backgroundColor: Get.isDarkMode
            ? AppColors.primaryTextColor
            : Color(0xffE8F0FF),
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(60.r))));
  }
}