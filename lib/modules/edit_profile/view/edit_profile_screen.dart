import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/shared/widgets/shared_widgets.dart';
import '../../../shared/colors/app_colors.dart';

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
        
        title: Text('screentitle4'.tr,style:  context.theme.textTheme.bodyText1,),
      ),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(20.0.h.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50.r,
                    backgroundColor: Colors.grey.shade400,
                    child: Image.asset('assets/images/Path 66.png',
                    width: 15.w,
                    height: 15.h,),
                  ),
                ),
          
                SizedBox(height: 16.h,),
          
          
                Text('username'.tr,
                      style:  context.theme.textTheme.bodyText1
                      ),
                       Text('1234567890',
                      style: TextStyle(
                        color: Color(0xff95989A),
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400
                      ),
                      ),
                                    SizedBox(height: 25.h,),
          
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 15.w),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('label1'.tr,
                                          style: context.theme.textTheme.bodyMedium),
                                             SizedBox(height: 10.h,),
                                   
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Container(
                    width: 148.w,
                    height: 54.h,
                     child: DefaultTextForm(textEditingController: TextEditingController(),
                                                       textInputType: TextInputType.text, 
                                                       validator:(value) => 'Uncorrect Name',
                                                       label: 'hint01'.tr),
                   ),

                    Container(
                width: 148.w,
                height: 54.h,
                 child: DefaultTextForm(textEditingController: TextEditingController(),
                                                   textInputType: TextInputType.text, 
                                                   validator:(value) => 'Uncorrect Name',
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
                                                     validator:(value) => 'Uncorrect Name',
                                                     label: 'hint01'.tr),
                                                      SizedBox(height: 15.h,),
                                             
                                   
                                             Text('label3'.tr,
                                            style: context.theme.textTheme.bodyMedium,),
                                             SizedBox(height: 10.h,),
                                          DefaultTextForm(textEditingController: TextEditingController(),
                                                     textInputType: TextInputType.text, 
                                                     validator:(value) => 'Uncorrect Name',
                                                     label: 'dd/mm/yyyy',
                                                       hasPrefixIcon: true,
                                                     iconData: Icons.calendar_month_outlined),
                                                      SizedBox(height: 15.h,),
                                   
                                  
                                             Text('label4'.tr,
                                            style: context.theme.textTheme.bodyMedium),
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

                DefaultButton(text: 'button3'.tr,screen:RoutesClass.getLayoutRoute()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}