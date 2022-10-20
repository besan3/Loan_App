import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:loan_app/controllers/homeController.dart';
import 'package:loan_app/views/home/notification_screen.dart';

import '../../shared/components/styles/colors.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homecontroller) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: primaryColor,
                elevation: 0.0,
                title: Text(homecontroller.screensTitels[homecontroller.index]),
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.to(NotificationsScreen());
                      },
                      icon: Image.asset('assets/images/Vector.png'))
                ],
              ),
              backgroundColor: primaryColor,
              bottomNavigationBar: CurvedNavigationBar(
                color: backgroundColor,
                items: homecontroller.screensIcons,
                buttonBackgroundColor: primaryColor,
                
                backgroundColor: Color.fromARGB(255, 255, 252, 252),
                index: homecontroller.index,
                onTap: (index) => homecontroller.changeScreen(index),
              ),
              body: homecontroller.screens[homecontroller.index]);
        });
  }
}
