import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:loan_app/features/home/presenttion/controller/homeController.dart';
import 'package:loan_app/features/notifications/presenttion/widgets/notification_widget.dart';
import 'package:loan_app/core/app_images/app_images.dart';
import 'package:loan_app/core/colors/app_colors.dart';
import '../../../../core/app_texts/app_texts.dart';
import '../../data/models/notification_model.dart';


class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(

      builder:(notificationscontroller) =>  Scaffold(
       
        appBar: AppBar(

         
          
          title: Text(AppTexts.notifications.tr,
        ),
       
        ),
        backgroundColor:AppColors. primaryColor,
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
                      borderRadius: BorderRadius.vertical(top: Radius.circular(55)),
                      color: Get.isDarkMode?AppColors.primaryTextColor:Colors.white),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                 
                      SizedBox(
                        height: 15,
                      ),
                    Expanded(child: ListView.separated(
                      separatorBuilder: (context, index) => Divider(
                        thickness: 1,
                      ),
                      itemBuilder: ((context, index) =>  Column(
                        children: [
                       NotificationsItem(NotificationModel(
image: AppImages.profile,
name: AppTexts.username.tr,
description: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry',
time: '4h ago',

                          )),
                     
                        ],
                      )),
                     itemCount:2,
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