import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/loan/model/loan_model.dart';
import 'package:loan_app/resources/colors/app_colors.dart';

class DefaultLoanCard extends StatelessWidget {
  LoanModel loanModel;
  DefaultLoanCard(this.loanModel);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        loanModel.number!,
        style: context.theme.textTheme.bodyText1?.copyWith(fontSize: 16.sp, color:Get.isDarkMode?Colors.white: AppColors.primaryTextColor),
      ),
      subtitle: Text(
        loanModel.date!,
        style: context.theme.textTheme.bodyText1?.copyWith(fontSize: 16.sp, color:Get.isDarkMode?Colors.white: AppColors.primaryTextColor),

      ),
      leading: Container(
          width: 56.w,
          height: 56.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r), color: Color(0xffF0EFFF)),
          child: Image.asset(
            loanModel.icon!,
            width: 20.w,
            height: 20.h,
          )),
      trailing: Text(
        loanModel.amount!,
        style:context.theme.textTheme.bodyText1?.copyWith(fontSize: 16.sp, color: AppColors.primaryTextColor),
      ),
    );
  }
}
