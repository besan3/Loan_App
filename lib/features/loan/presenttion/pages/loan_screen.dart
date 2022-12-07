import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/features/home/presenttion/controller/homeController.dart';
import 'package:loan_app/features/loan/data/models/loan_model.dart';
import 'package:loan_app/features/loan/presenttion/widgets/loan_card_widget.dart';
import 'package:loan_app/core/app_images/app_images.dart';
import '../../../../core/widgets/shared_widgets.dart';
import 'package:loan_app/core/colors/app_colors.dart';
import 'package:loan_app/core/routes/routes.dart';

import '../../../../core/app_texts/app_texts.dart';


class LoanScreen extends StatelessWidget {
  const LoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (loancontroller)=>
      Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          title: Text(AppTexts.loan.tr),
        ),
        body: SafeArea(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 40.h),
                          child: ListTile(
                            title: Text(AppTexts.username.tr,style: context.theme.textTheme.bodyText1,),
                            subtitle: Text(AppTexts.number.tr),
                            trailing: Image.asset(AppImages.profile,
                            width: 65.w,height: 65.h,
                            ),
                          ),
                        ),

                        Center(child: Text(AppTexts.amount_ex,style:  context.theme.textTheme.bodyText1?.copyWith(fontSize: 28.sp,color: Colors.black),)),
                        SizedBox(height: 10.h,),
                                                Center(child: Text(AppTexts.date_ex,
                            style:context.theme.textTheme.headline2)),
                        SizedBox(height: 30.h,),

                        Text(AppTexts.transaction.tr,style:
                        context.theme.textTheme.bodyText1?.copyWith(color:Get.isDarkMode?Colors.white: AppColors.primaryTextColor)),
                        SizedBox(height: 20.h,),

                        Expanded(child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                            thickness: 1,
                          ),
                          itemBuilder: ((context, index) =>
                        DefaultLoanCard(LoanModel(
                          icon: loancontroller.loanIcons[index],
                          number: AppTexts.number.tr,
                          date: AppTexts.date_ex,
                          amount: AppTexts.amount_ex

                        ),

                        )



                         ),
                         itemCount: loancontroller.loanIcons.length,)),
                                                 SizedBox(height: 30.h,),

DefaultButton(text: AppTexts.pay_loan.tr,screen: RoutesClass.getRequestRoute()),
                      ],
                    ),
                    ),
      ),
      ]),
      )
      ));
      
  }
}