import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/shared/components/components.dart';

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
          
          
                Text('Setup your account',
                      style: TextStyle(
                      //  color: backgroundColor,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                                    SizedBox(height: 25.h,),
          
                                    Padding(
                                      padding:  EdgeInsets.symmetric(horizontal: 15.w),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Full Name',
                                          style: TextStyle(color: Color(0xff474F55),
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
                                                       validator:(value) => 'Uncorrect Name',
                                                       label: 'First Name'),
                   ),
                    Container(
                width: 148.w,
                height: 54.h,
                 child: DefaultTextForm(textEditingController: TextEditingController(),
                                                   textInputType: TextInputType.text, 
                                                   validator:(value) => 'Uncorrect Name',
                                                   label: 'Last Name'),
               ),
                 ],
               ),
                  SizedBox(height: 15.h,),
Text('Email',
                                            style: TextStyle(color: Color(0xff474F55),
                                            fontSize: 16.sp,fontWeight: FontWeight.w400
                                            ),),
                                             SizedBox(height: 10.h,),
                                          DefaultTextForm(textEditingController: TextEditingController(),
                                                     textInputType: TextInputType.emailAddress, 
                                                     validator:(value) => 'Uncorrect Name',
                                                     label: 'Enter your email address'),
                                                      SizedBox(height: 15.h,),
                                             
                                   
                                             Text('Date of birth',
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
                                   
                                  
                                             Text('Address',
                                            style: TextStyle(color: Color(0xff474F55),
                                            fontSize: 16.sp,fontWeight: FontWeight.w400
                                            ),),
                                             SizedBox(height: 10.h,),
                                          DefaultTextForm(textEditingController: TextEditingController(),
                                                     textInputType: TextInputType.text, 
                                                     validator:(value) => 'Uncorrect Name',
                                                     label: 'Gaza',
                                                     hasPrefixIcon: true,
                                                     iconData: Icons.location_on_outlined
                                                     ),
                                        ],
                                      ),
                                    ),
                                                SizedBox(height: 34.h,),
                                            
      DefaultButton(text: 'Continue',
   screen: RoutesClass.getLayoutRoute()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}