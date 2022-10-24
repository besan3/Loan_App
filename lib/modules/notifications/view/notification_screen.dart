import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/home/controllers/homeController.dart';
import 'package:loan_app/modules/notifications/widget/notification_widget.dart';
import '../../../shared/colors/app_colors.dart';
import '../model/notification_model.dart';


class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder:(notificationscontroller) =>  Scaffold(
       
        appBar: AppBar(
       backgroundColor: AppColors.primaryColor,
          elevation: 0.0,
         
          
          title: Text('screentitle5'.tr,
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
image: 'assets/images/profile.png',
name: 'username'.tr,
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