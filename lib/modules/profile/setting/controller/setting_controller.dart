import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loan_app/shared/colors/app_colors.dart';
import '../../../../main.dart';
enum Themes { System, Light, Dark }

enum Language { System, Arabic, English }

class SettingController extends GetxController{


  Themes theme=Themes.Light;
 Language language=Language.English;
  final _darkThemeKey='isDarkTheme';
  bool isDark=true;
Locale? initialLang= sharepref!.getString('lang')==null?Get.deviceLocale:Locale(sharepref!.getString('lang')!);




void changeLang(String langCode){

  Locale locale=Locale(langCode);
  sharepref!.setString('lang',langCode);
  Get.updateLocale(locale);
}



  void saveThemeData(bool isDarkMode){

    sharepref!.setBool(_darkThemeKey, isDarkMode);
  }

  bool isSavedDrakMode(){
    return sharepref!.getBool(_darkThemeKey)??false;
  }

  ThemeMode getThemeMode(){
    return isSavedDrakMode()? ThemeMode.dark:ThemeMode.light;
  }

  void changeTheme(){
    Get.changeThemeMode(isSavedDrakMode()? ThemeMode.light:ThemeMode.dark);
    saveThemeData(isSavedDrakMode());
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

                      update();


                      })),
              ListTile(
                title: Text('Light '),
                leading: Radio<Themes>(
                    value: Themes.Light,
                    groupValue: theme,
                    onChanged: (value) {

                          theme = value!;

                      update();
                      isDark==false;
isSavedDrakMode()==false;

changeTheme();
Get.changeThemeMode(ThemeMode.light);
                    }),
              ),
              ListTile(
                title: Text('Dark '),
                leading: Radio<Themes>(
                    value: Themes.Dark,
                    groupValue: theme,
                    onChanged: (value) {

                          theme = value!;

                     update();
                      isDark==true;
                      isSavedDrakMode()==true;


                 changeTheme();
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