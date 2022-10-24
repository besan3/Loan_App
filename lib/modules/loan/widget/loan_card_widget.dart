import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_app/modules/loan/model/loan_model.dart';
import '../../../shared/colors/app_colors.dart';
import '../../../themes/themes.dart';

class DefaultLoanCard extends StatelessWidget {
  LoanModel loanModel;
  DefaultLoanCard(this.loanModel);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        loanModel.number!,
        style:  AppThemes.CustomLightTheme.textTheme.bodyText1?.copyWith(fontSize: 16.sp, color: AppColors.primaryTextColor),
      ),
      subtitle: Text(
        loanModel.date!,
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
        style:  AppThemes.CustomLightTheme.textTheme.bodyText1?.copyWith(fontSize: 16.sp, color: AppColors.primaryTextColor),
      ),
    );
  }
}
