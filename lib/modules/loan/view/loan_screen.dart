import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/home/controllers/homeController.dart';
import 'package:loan_app/modules/loan/model/loan_model.dart';
import 'package:loan_app/modules/loan/widget/loan_card_widget.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/shared/widgets/shared_widgets.dart';
import '../../../shared/colors/app_colors.dart';


class LoanScreen extends StatelessWidget {
  const LoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (loancontroller)=>
      Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColors.primaryColor,
          title: Text('screentitle2'.tr),
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
                            title: Text('username'.tr,style:  Theme.of(context).textTheme.bodyText1?.copyWith(color: AppColors.primaryTextColor),),
                            subtitle: Text('1234567890'),
                            trailing: Image.asset('assets/images/profile.png',
                            width: 65.w,height: 65.h,
                            ),
                          ),
                        ),

                        Center(child: Text('2.000\$',style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 28.sp,color: Colors.black),)),
                        SizedBox(height: 10.h,),
                                                Center(child: Text('12.Nov.2022',style:  Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 16.sp,color: Color(0xff767D88)),)),
                        SizedBox(height: 30.h,),

                        Text('transaction'.tr,style: Theme.of(context).textTheme.bodyText1?.copyWith(color:Get.isDarkMode?Colors.white: AppColors.primaryTextColor)),
                        SizedBox(height: 20.h,),

                        Expanded(child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                            thickness: 1,
                          ),
                          itemBuilder: ((context, index) =>
                        DefaultLoanCard(LoanModel(
                          icon: loancontroller.loanIcons[index],
                          number: '1234567890',
                          date: 'December 28, 2021',
                          amount: '\$100.00'

                        ),

                        )



                         ),
                         itemCount: loancontroller.loanIcons.length,)),
                                                 SizedBox(height: 30.h,),

DefaultButton(text: 'button4'.tr,screen: RoutesClass.getRequestRoute()),
                      ],
                    ),
                    ),
      ),
      ]),
      )
      ));
      
  }
}