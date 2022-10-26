import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/resources/app_images/app_images.dart';
import 'package:loan_app/resources/app_sizes/app_sizes.dart';
import 'package:loan_app/resources/routes/routes.dart';
import '../../../../resources/app_texts/app_texts.dart';
import '../../../../resources/widgets/shared_widgets.dart';

class SetupAccountScreen extends StatelessWidget {
  const SetupAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(AppSizes.padding20.h.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(AppImages.setup,
                  width: AppSizes.setupImageWidth.w,
                  height: AppSizes.setupImageheight.h,),
                ),
          
                SizedBox(height: AppSizes.sizedBox16.h,),
          
          
                Text(AppTexts.setup.tr,
                      style: context.theme.textTheme.bodyText1
                      ),
                                    SizedBox(height: AppSizes.sizedBox25.h,),
          
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: AppSizes.sizedBox15.w),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(AppTexts.full_name.tr,
                                          style:  context.theme.textTheme.headline3,
                                         ),
                                             SizedBox(height: AppSizes.radius10.h,),
                                   
               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                     width: AppSizes.containerWidth.w,
                     height: AppSizes.containerheight.h,
                     child: DefaultTextForm(textEditingController: TextEditingController(),
                                                       textInputType: TextInputType.text,
                         validator: (String? value) {
                           if(value!.isEmpty) {
                             return 'Please Enter your First Name';
                           }
                         },
                                                       label: AppTexts.first_name.tr),
                   ),
                    Container(
                width: AppSizes.containerWidth.w,
                height: AppSizes.containerheight.h,
                 child: DefaultTextForm(textEditingController: TextEditingController(),
                                                   textInputType: TextInputType.text,
                     validator: (String? value) {
                       if(value!.isEmpty) {
                         return 'Please Enter your Last Name';
                       }
                     },
                                                   label: AppTexts.last_name.tr),
               ),
                 ],
               ),
                  SizedBox(height: AppSizes.sizedBox15.h,),
Text(AppTexts.email.tr,
                                            style: context.theme.textTheme.headline3,),
                                             SizedBox(height: AppSizes.radius10.h,),
                                          DefaultTextForm(textEditingController: TextEditingController(),
                                                     textInputType: TextInputType.emailAddress,
                                              validator: (String? value) {
                                                if(value!.isEmpty) {
                                                  return 'Please Enter your email address';
                                                }
                                              },
                                                     label: AppTexts.email.tr),
                                                      SizedBox(height: AppSizes.sizedBox15.h,),
                                             
                                   
                                             Text(AppTexts.dOb.tr,
                                            style: context.theme.textTheme.headline3,),
                                             SizedBox(height: AppSizes.radius10.h,),
                                          DefaultTextForm(textEditingController: TextEditingController(),
                                                     textInputType: TextInputType.text, 
                                                     validator:(value) => 'Uncorrect Name',
                                                     label: AppTexts.date.tr,
                                                       hasPrefixIcon: true,
                                                     iconData: Icons.calendar_month_outlined),
                                          SizedBox(height: AppSizes.sizedBox15.h,),
                                   
                                  
                                             Text(AppTexts.location.tr,
                                            style: context.theme.textTheme.headline3),
                                             SizedBox(height: AppSizes.radius10.h,),
                                          DefaultTextForm(
                                              textEditingController: TextEditingController(),
                                                     textInputType: TextInputType.text, 
                                                     validator:(value) => 'Uncorrect Name',
                                                     label: AppTexts.location.tr,
                                                     hasPrefixIcon: true,
                                                     iconData: Icons.location_on_outlined
                                                     ),
                                        ],
                                      ),
                                    ),
                SizedBox(height: AppSizes.sizedBox36.h,),
                                            
      DefaultButton(text:AppTexts.continuebutton.tr,
   screen: RoutesClass.getLayoutRoute()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}