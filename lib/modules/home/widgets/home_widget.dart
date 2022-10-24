import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/home/models/home_model.dart';

import '../../loan/view/loan_screen.dart';

class HomeCard extends StatelessWidget {
  HomeModel homeModel;
  HomeCard({
    required this.homeModel
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() => Get.to(LoanScreen())),
      child: Container(
        width: 335.w,
        height: 97.5.h,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
              side: BorderSide(color: Color(0xff244AD3).withOpacity(0.5))),
          child: ListTile(
            leading: Image.asset(
              homeModel.image!,
              width: 65.w,
              height: 65.h,
            ),
            title: Text(homeModel.name!),
            subtitle: Text(homeModel.number!,style: Theme.of(context).textTheme.subtitle1,),
          ),
        ),
      ),
    );
  }
}
