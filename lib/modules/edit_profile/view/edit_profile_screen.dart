import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/resources/app_images/app_images.dart';
import 'package:loan_app/resources/app_sizes/app_sizes.dart';
import '../../../resources/widgets/shared_widgets.dart';
import 'package:loan_app/resources/colors/app_colors.dart';
import 'package:loan_app/resources/routes/routes.dart';

import '../../../resources/app_texts/app_texts.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        leading:
          IconButton(
            icon: Icon(Icons.arrow_back,color:Get.isDarkMode?Colors.white: AppColors.primaryTextColor,),
            onPressed: (() => Navigator.pop(context)),
          ),
        
        title: Text(AppTexts.my_profile.tr),
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(AppSizes.padding20.h.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius:  AppSizes.radius50.r,
                    backgroundColor: Colors.grey.shade400,
                    child: Image.asset(AppImages.camera,
                    width: AppSizes.radius15.w,
                    height: AppSizes.radius15.h,),
                  ),
                ),
          
                SizedBox(height: AppSizes.radius15.h,),
          
          
                Text(AppTexts.username.tr,
                      style:  context.theme.textTheme.bodyText1
                      ),
                       Text(AppTexts.number.tr,
                      style: context.theme.textTheme.headline4
                      ),
                                    SizedBox(height: AppSizes.sizedBox25.h,),
          
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: AppSizes.radius15.w),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(AppTexts.full_name.tr,
                                          style: context.theme.textTheme.headline3),
                                             SizedBox(height:  AppSizes.sizedBox10.h,),
                                   
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                    width: AppSizes.containerWidth.w,
                    height: AppSizes.containerheight.h,
                     child: DefaultTextForm(textEditingController: TextEditingController(),
                                                       textInputType: TextInputType.text, 
                                                       validator:(value) => 'Uncorrect Name',
                                                       label: AppTexts.first_name.tr),
                   ),

                    Container(
                      width: AppSizes.containerWidth.w,
                      height: AppSizes.containerheight.h,
                 child: DefaultTextForm(textEditingController: TextEditingController(),
                                                   textInputType: TextInputType.text, 
                                                   validator:(value) => 'Uncorrect Name',
                                                   label:AppTexts.last_name.tr),
               ),
                 ],
               ),
                  SizedBox(height: AppSizes.radius15.h,),
Text(AppTexts.email.tr,
                                            style:  context.theme.textTheme.headline3,),
                                             SizedBox(height:  AppSizes.sizedBox10.h,),
                                          DefaultTextForm(textEditingController: TextEditingController(),
                                                     textInputType: TextInputType.emailAddress, 
                                                     validator:(value) => 'Uncorrect Name',
                                                     label: AppTexts.email.tr),
                                                      SizedBox(height: AppSizes.radius15.h,),
                                             
                                   
                                             Text(AppTexts.dOb.tr,
                                            style: context.theme.textTheme.headline3,),
                                             SizedBox(height:  AppSizes.sizedBox10.h,),
                                          DefaultTextForm(textEditingController: TextEditingController(),
                                                     textInputType: TextInputType.text, 
                                                     validator:(value) => 'Uncorrect Name',
                                                     label: 'dd/mm/yyyy',
                                                       hasPrefixIcon: true,
                                                     iconData: Icons.calendar_month_outlined),
                                                      SizedBox(height: AppSizes.radius15.h,),
                                   
                                  
                                             Text(AppTexts.address.tr,
                                            style: context.theme.textTheme.headline3),
                                             SizedBox(height: AppSizes.sizedBox10.h,),
                                          DefaultTextForm(textEditingController: TextEditingController(),
                                                     textInputType: TextInputType.text, 
                                                     validator:(value) => 'Uncorrect Name',
                                                     label:AppTexts.gaza.tr,
                                                     hasPrefixIcon: true,
                                                     iconData: Icons.location_on_outlined
                                                     ),
                                        ],
                                      ),
                                    ),
                                                SizedBox(height: AppSizes.sizedBox34.h,),

                DefaultButton(text:AppTexts.save_changes.tr,screen:RoutesClass.getLayoutRoute()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}