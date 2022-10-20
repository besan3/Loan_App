import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/shared/components/components.dart';
import 'package:loan_app/shared/components/styles/colors.dart';
import 'package:loan_app/controllers/homeController.dart';
import 'package:loan_app/controllers/setting_controller.dart';
import 'package:loan_app/shared/components/styles/texts.dart';
import 'package:loan_app/views/profile/personal_detailes_screen.dart';

class ProfileSettingScreen extends StatefulWidget {
  ProfileSettingScreen({super.key});

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {

  Theme theme = Theme.Light;
  Language language = Language.English;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      init: SettingController(),
      builder: (settingcontroller) => Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          backgroundColor:primaryColor,
          title: Text('Setting'),
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          minimum: EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(55)),
                    color: backgroundColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    InkWell(
                      onTap: () => Get.bottomSheet(
                          StatefulBuilder(
                            builder: (context, setState) => Column(
                              children: [
                                const SizedBox(height: 20),
                                ListTile(
                                    title: Text('System default '),
                                    leading: Radio<Theme>(
                                        activeColor: primaryColor,
                                        value: Theme.System,
                                        groupValue: theme,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              theme = value!;
                                            },
                                          );
                                          this.setState(() {
                                            
                                          });
                                        })),
                                ListTile(
                                  title: Text('Light '),
                                  leading: Radio<Theme>(
                                      value: Theme.Light,
                                      groupValue: theme,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            theme = value!;
                                          },
                                        );
                                        /*this.setState(() {
                                          Get.changeTheme(ThemeData.light());
                                        });*/
                                          this.setState(() {
                                        
                                      });
                                      }),
                                ),
                                ListTile(
                                  title: Text('Dark '),
                                  leading: Radio<Theme>(
                                      value: Theme.Dark,
                                      groupValue: theme,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            theme = value!;
                                          },
                                        );
                                        /*this.setState(() {
                                          Get.changeTheme(ThemeData.dark());
                                        });*/
                                          this.setState(() {
                                        
                                      });
                                      }),
                                ),
                              ],
                            ),
                          ),
                          backgroundColor: Get.isDarkMode
                              ? primaryTextColor
                              : Color(0xffE8F0FF),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(60)))),
                      child: ListTile(
                        leading: CircleAvatar(
                            child: Icon(Icons.dark_mode_outlined),
                            radius: 40,
                            backgroundColor: Color(0xffE8F0FF)),
                        title: Text('Theme',
                            style: bigTextStyle.copyWith(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : primaryTextColor)),
                        subtitle: Text(
                          theme.name,
                          style: smallTextStyle.copyWith(
                              color: theme.name == Theme.Dark
                                  ? Colors.white
                                  : primaryTextColor,
                              fontSize: 16),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.bottomSheet(
                          StatefulBuilder(
                            builder: (context, setState) => Column(
                              children: [
                                const SizedBox(height: 20),
                                ListTile(
                                    title: Text('System default '),
                                    leading: Radio<Language>(
                                        activeColor: primaryColor,
                                        value: Language.System,
                                        groupValue: language,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              language = value!;
                                            },
                                          );  this.setState(() {
                                        
                                      });
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
                                        this.setState(() {
                                        
                                      });
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
                                      this.setState(() {
                                        
                                      });
                                    
                                      }),
                                ),
                              ],
                            ),
                          ),
                          backgroundColor: Get.isDarkMode
                              ? primaryTextColor
                              : Color(0xffE8F0FF),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(60)))),
                      child: ListTile(
                        leading: CircleAvatar(
                            child: Icon(Icons.language_outlined),
                            radius: 40,
                            backgroundColor: Color(0xffE8F0FF)),
                        title: Text('Language',
                            style: bigTextStyle.copyWith(
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : primaryTextColor)),
                        subtitle: Text(
                          language.name,
                          style: smallTextStyle.copyWith(
                              color: theme.name == Theme.Dark
                                  ? Colors.white
                                  : primaryTextColor,
                              fontSize: 16),
                        ),
                      ),
                    )
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}

enum Theme { System, Light, Dark }

enum Language { System, Arabic, English }
