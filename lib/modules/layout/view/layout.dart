import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/home/controllers/homeController.dart';
import 'package:loan_app/modules/notifications/view/notification_screen.dart';
import 'package:loan_app/resources/app_images/app_images.dart';
import 'package:loan_app/resources/colors/app_colors.dart';


class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homecontroller) {
          return Scaffold(
              appBar: AppBar(

                title: Text(homecontroller.screensTitels[homecontroller.index].tr),
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.to(NotificationsScreen());
                      },
                      icon: Image.asset(AppImages.notification))
                ],
              ),
              backgroundColor: AppColors.primaryColor,
              bottomNavigationBar: CurvedNavigationBar(
                color: Get.isDarkMode?AppColors.primaryTextColor:Colors.white,
                items: homecontroller.screensIcons,
                buttonBackgroundColor: AppColors.primaryColor,
                
                backgroundColor: Color.fromARGB(255, 255, 252, 252),
                index: homecontroller.index,
                onTap: (index) => homecontroller.changeScreen(index),
              ),
              body: homecontroller.screens[homecontroller.index]);
        });
  }
}
