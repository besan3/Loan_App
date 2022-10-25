import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/routes/routes.dart';
import '../../../../shared/widgets/shared_widgets.dart';

class SetupAccountScreen extends StatelessWidget {
  const SetupAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(20.0.h.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset('assets/images/Group 6.png',
                  width: 155.w,
                  height: 125.h,),
                ),
          
                SizedBox(height: 16.h,),
          
          
                Text('setup'.tr,
                      style: context.theme.textTheme.bodyText1
                      ),
                                    SizedBox(height: 25.h,),
          
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 15.w),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('label1'.tr,
                                          style:  context.theme.textTheme.headline2?.copyWith(color: Color(0xff474F55),
                                          fontSize: 16.sp,fontWeight: FontWeight.w400
                                          ),),
                                             SizedBox(height: 10.h,),
                                   
               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                    width: 148.w,
                    height: 54.h,
                     child: DefaultTextForm(textEditingController: TextEditingController(),
                                                       textInputType: TextInputType.text,
                         validator: (String? value) {
                           if(value!.isEmpty) {
                             return 'Please Enter your First Name';
                           }
                         },
                                                       label: 'hint01'.tr),
                   ),
                    Container(
                width: 148.w,
                height: 54.h,
                 child: DefaultTextForm(textEditingController: TextEditingController(),
                                                   textInputType: TextInputType.text,
                     validator: (String? value) {
                       if(value!.isEmpty) {
                         return 'Please Enter your Last Name';
                       }
                     },
                                                   label: 'hint02'.tr),
               ),
                 ],
               ),
                  SizedBox(height: 15.h,),
Text('label2'.tr,
                                            style: TextStyle(color: Color(0xff474F55),
                                            fontSize: 16.sp,fontWeight: FontWeight.w400
                                            ),),
                                             SizedBox(height: 10.h,),
                                          DefaultTextForm(textEditingController: TextEditingController(),
                                                     textInputType: TextInputType.emailAddress,
                                              validator: (String? value) {
                                                if(value!.isEmpty) {
                                                  return 'Please Enter your email address';
                                                }
                                              },
                                                     label: 'hint03'.tr),
                                                      SizedBox(height: 15.h,),
                                             
                                   
                                             Text('label3'.tr,
                                            style: TextStyle(color: Color(0xff474F55),
                                            fontSize: 16.sp,fontWeight: FontWeight.w400
                                            ),),
                                             SizedBox(height: 10.h,),
                                          DefaultTextForm(textEditingController: TextEditingController(),
                                                     textInputType: TextInputType.text, 
                                                     validator:(value) => 'Uncorrect Name',
                                                     label: 'dd/mm/yyyy',
                                                       hasPrefixIcon: true,
                                                     iconData: Icons.calendar_month_outlined),
                                                      SizedBox(height: 15.h,),
                                   
                                  
                                             Text('label4'.tr,
                                            style: TextStyle(color: Color(0xff474F55),
                                            fontSize: 16.sp,fontWeight: FontWeight.w400
                                            ),),
                                             SizedBox(height: 10.h,),
                                          DefaultTextForm(textEditingController: TextEditingController(),
                                                     textInputType: TextInputType.text, 
                                                     validator:(value) => 'Uncorrect Name',
                                                     label: 'hint05'.tr,
                                                     hasPrefixIcon: true,
                                                     iconData: Icons.location_on_outlined
                                                     ),
                                        ],
                                      ),
                                    ),
                                                SizedBox(height: 34.h,),
                                            
      DefaultButton(text: 'button2'.tr,
   screen: RoutesClass.getLayoutRoute()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}