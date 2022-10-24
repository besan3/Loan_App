import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/home/controllers/homeController.dart';
import 'package:loan_app/shared/widgets/shared_widgets.dart';
import '../../../shared/colors/app_colors.dart';
import '../../home/models/home_model.dart';
import '../../home/widgets/home_widget.dart';

class UsersScreen extends StatelessWidget {
   UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homecontroller) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.primaryColor,
                elevation: 0.0,
                title: Text('screentitle3'.tr),
                actions: [
              
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/Vector (5).png')
                      )
                ],
              ),
              backgroundColor: AppColors.primaryColor,
 
              body:SafeArea(
          top: true,
          minimum: EdgeInsets.only(top: 30.h),
          child: Column(
            children: [
             
              Expanded(
                  child: Container(
             
                padding: EdgeInsets.all(20.h.w),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(55.r)),
                    color: Get.isDarkMode?AppColors.primaryTextColor:Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      SizedBox(
                      height: 40.h,
                    ),
                    DefaultTextForm(textEditingController: TextEditingController(), textInputType: TextInputType.text, validator: ((value) => ''), label: 'hint30'.tr,hasPrefixIcon: true,iconData: Icons.search),
                    SizedBox(
                      height: 30.h,
                    ),
                  Expanded(child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(height: 15.h,),
                    itemBuilder: ((context, index) =>  HomeCard(homeModel:HomeModel(
 image: 'assets/images/profile.png',
                      name: 'username'.tr,
                      number: '1234567890'
                    ))
                   ),
                   itemCount: 6,
                   ),
                   )
                  ],
                ),
              )),
            ],
          ),
        ),);
        });
  }
}