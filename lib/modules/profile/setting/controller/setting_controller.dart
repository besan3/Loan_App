import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/shared/colors/app_colors.dart';
import 'package:loan_app/shared/network/local/cache_helper.dart';
enum Themes { System, Light, Dark }

enum Language { System, Arabic, English }

class SettingController extends GetxController{


  Themes theme=Themes.Light;
 Language language=Language.English;

Locale? initialLang= SharedPrefs.getString('lang')==null?Get.deviceLocale:Locale(SharedPrefs.getString('lang')!);
//ThemeMode? intialMode=(sharepref!.getBool('isDarkTheme')==true?ThemeMode.system:getThemeMode()) ;

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
                  title: Text('System default '),
                  leading: Radio<Themes>(
                      activeColor: AppColors.primaryColor,
                      value: Themes.System,
                      groupValue: theme,
                      onChanged: (value) {
                        setState(
                              () {
                            theme = value!;

                          },
                        );

                     // update();


                      })),
              ListTile(
                title: Text('Light '),
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
                title: Text('Dark '),
                leading: Radio<Themes>(
                    value: Themes.Dark,
                    groupValue: theme,
                    onChanged: (value) {

                         setState((){
                           theme = value!;
                          setAppThemeMode(ThemeMode.dark);
                         });




               //  changeTheme();
                      print('changed');

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
                  title: Text('System default '),
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
                        //update();
                      Get.deviceLocale;

                      })),
              ListTile(
                title: Text('English '),
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
                title: Text('Arabic '),
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