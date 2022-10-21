import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/home/controllers/homeController.dart';
import 'package:loan_app/routes/routes.dart';

import '../../../shared/components/components.dart';
import '../../../shared/components/styles/colors.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (requestcontroller) => Scaffold(
              backgroundColor: primaryColor,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: primaryColor,
                title: Text('Request'),
              ),
              body: SafeArea(
                  top: true,
                  minimum: EdgeInsets.only(top: 30.h),
                  child: Column(children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.all(20.h.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(55.r)),
                          color: Get.isDarkMode?primaryTextColor:Colors.white),
                    child: Padding(
                      padding:  EdgeInsets.all(20.0.h.w),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                                                         SizedBox(height: 30.h,),

                            Text('Phone number',
                                                style: TextStyle(color: Color(0xff474F55),
                                                fontSize: 16,fontWeight: FontWeight.w400
                                                ),),
                                                 SizedBox(height: 10.h,),
                                                DefaultTextForm(textEditingController: TextEditingController(),
                                                         textInputType: TextInputType.phone,
                                                         validator:(value) => 'Uncorrect Name',
                                                         label: 'Enter your Phone number'),
                                                          SizedBox(height: 15.h,),


                                                 Text('Deadline',
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


                                                 Text('Amount',
                                                style: TextStyle(color: Color(0xff474F55),
                                                fontSize: 16.sp,fontWeight: FontWeight.w400
                                                ),),
                                                 SizedBox(height: 10.h,),
                                                DefaultTextForm(textEditingController: TextEditingController(),
                                                         textInputType: TextInputType.text,
                                                         validator:(value) => 'Uncorrect Name',
                                                         label: '1.200',
                                                         hasPrefixIcon: true,
                                                         iconData: Icons.monetization_on_outlined
                                                         ),
                                                 SizedBox(height: 40.h,),

                                                       DefaultButton( text: 'Confirm',screen: RoutesClass.getProfileRoute())
                          ],
                        ),
                      ),
                    ),),

                    ),


                  ])),
            ));
  }
}
