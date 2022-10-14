import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/shared/components/components.dart';
import 'package:loan_app/shared/components/styles/colors.dart';
import 'package:loan_app/controllers/homeController.dart';
import 'package:loan_app/controllers/setting_controller.dart';
import 'package:loan_app/viewModels/home_model.dart';
import 'package:loan_app/viewModels/setting_model.dart';
import 'package:loan_app/views/profile/personal_detailes_screen.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({super.key});
  HomeModel homeModel=HomeModel();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      init: SettingController(),

      builder: (settingcontroller)=>SafeArea(
          top: true,
          minimum: EdgeInsets.only(top: 30),
          child: Column(
            children: [
             
              Expanded(
                  child: Container(
             
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(55)),
                    color: backgroundColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                 Image.asset('assets/images/profile.png',width: 154,height: 154,fit: BoxFit.cover,),
                    Text('John Doe',style: TextStyle(
                   color: primaryTextColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700
                    ),),
                    SizedBox(
                      height: 15,
                    ),
                  Expanded(child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 15,),
                    itemBuilder: ((context, index) =>  defaultProfileCard(SettingModel(
cardIcon: settingcontroller.cardIcons[index],
title: settingcontroller.cardTitle[index],
screen: settingcontroller.cardScreens[index]
                    
                    ))),
                   itemCount: settingcontroller.cardIcons.length,
                   ),
                   )
                  ],
                ),
              )),
            ],
          ),
        ),
      
    );
  }
}
