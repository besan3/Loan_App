import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/home/controllers/homeController.dart';
import 'package:loan_app/modules/home/models/loan_model.dart';
import 'package:loan_app/modules/home/widgets/loan_card_widget.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/shared/components/components.dart';
import 'package:loan_app/shared/components/styles/colors.dart';
import 'package:loan_app/shared/components/styles/texts.dart';


class LoanScreen extends StatelessWidget {
  const LoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (loancontroller)=>
      Scaffold(
        backgroundColor: primaryColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: primaryColor,
          title: Text('Loan'),
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
                    color: Get.isDarkMode?primaryTextColor:Colors.white),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 40.h),
                          child: ListTile(
                            title: Text('John Doe',style: bigTextStyle.copyWith(color: primaryTextColor),),
                            subtitle: Text('1234567890'),
                            trailing: Image.asset('assets/images/profile.png',
                            width: 65.w,height: 65.h,
                            ),
                          ),
                        ),

                        Center(child: Text('2.000\$',style: bigTextStyle.copyWith(fontSize: 28.sp,color: Colors.black),)),
                        SizedBox(height: 10.h,),
                                                Center(child: Text('12.Nov.2022',style: smallTextStyle.copyWith(fontSize: 16.sp,color: Color(0xff767D88)),)),
                        SizedBox(height: 30.h,),

                        Text('Transaction ',style: bigTextStyle.copyWith(color: primaryTextColor)),
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

DefaultButton(text: 'Pay your loan',screen: RoutesClass.getRequestRoute()),
                      ],
                    ),
                    ),
      ),
      ]),
      )
      ));
      
  }
}