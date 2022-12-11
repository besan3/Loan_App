import 'dart:math';
import 'package:circular_menu/circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/features/home/presenttion/controller/homeController.dart';
import 'package:loan_app/features/notifications/presenttion/pages/notification_screen.dart';
import 'package:loan_app/core/app_images/app_images.dart';
import 'package:loan_app/core/colors/app_colors.dart';
import 'package:loan_app/core/routes/routes.dart';
import 'package:loan_app/features/transactions/presenttion/binding/transaction_binding.dart';
import 'package:loan_app/features/transactions/presenttion/pages/creditor_view.dart';
import 'package:loan_app/features/transactions/presenttion/pages/dedtor_view.dart';
import 'package:loan_app/features/users/presenttion/controller/all_users_controller.dart';

class HomeLayout extends GetView<AllUsersController> {

  @override
  Widget build(BuildContext context) {

    return GetBuilder<AllUsersController>(
        builder: (homecontroller) {
         // controller.getUsers();
          return Scaffold(
              appBar: AppBar(
                title: Text(homecontroller.screensTitels[homecontroller.index].tr),
                actions: [
                  IconButton(
                      onPressed: () {
                        Get.to(const NotificationsScreen());
                      },
                      icon: Image.asset(AppImages.notification))
                ],
              ),
              backgroundColor: AppColors.primaryColor,

              floatingActionButton:


               CircularMenu(

                alignment: Alignment.bottomCenter,
                startingAngleInRadian: 1.25 * pi,
                endingAngleInRadian: 1.75 * pi,
              toggleButtonColor: AppColors.primaryColor,
               radius: 70,
animationDuration: Duration.zero,
                toggleButtonBoxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 5,
                  ),
                ],//  fabChild: Icon(Icons.add),
                items: [
                  CircularMenuItem(onTap: (){

                    Get.to(AddDebtorScreen(),binding: TransactionBinding());
                  },icon:Icons.arrow_downward,color: Colors.red,boxShadow: [ BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 5,
                  ),],
                  ),
                  CircularMenuItem(onTap: (){

                    Get.to(AddCreditorScreen(),binding: TransactionBinding());

                  },icon:Icons.arrow_upward,color: Colors.green,boxShadow: [ BoxShadow(
                    color: Colors.grey.shade500,
                    blurRadius: 5,
                  ),],),



                ],


              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

              bottomNavigationBar:
              BottomNavigationBar(
                selectedItemColor: AppColors.primaryColor,selectedIconTheme: IconThemeData(
                color: AppColors.primaryColor
              ),
                items: homecontroller.items,


                currentIndex: homecontroller.index,
                onTap: (index) => homecontroller.changeScreen(index),
              ),

              body: homecontroller.screens[homecontroller.index]);
        });
  }
}
