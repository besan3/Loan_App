import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/features/request/presenttion/controller/request_controller.dart';
import 'package:loan_app/core/app_sizes/app_sizes.dart';
import 'package:loan_app/core/colors/app_colors.dart';
import 'package:loan_app/features/transactions/presenttion/controllers/transaction_controller.dart';
import '../../../../core/widgets/shared_widgets.dart';
import '../../../../core/app_texts/app_texts.dart';

class AddDebtorScreen extends GetView<TransactionController> {
  const AddDebtorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          backgroundColor: AppColors.primaryColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: AppColors.primaryColor,
            title: Text(AppTexts.request.tr),
          ),
          body: SafeArea(
              top: true,
              minimum: EdgeInsets.only(top: AppSizes.padding30.h),
              child: Column(children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(AppSizes.padding20.h.w),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(
                            top: Radius.circular(AppSizes.radius55.r)),
                        color: Get.isDarkMode
                            ? AppColors.primaryTextColor
                            : Colors.white),
                    child: Padding(
                      padding: EdgeInsets.all(AppSizes.padding20.h.w),
                      child: SingleChildScrollView(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: AppSizes.sizedBox30.h,
                              ),
                              Text(AppTexts.phone_number.tr,
                                  style: context.theme.textTheme.headline3),
                              SizedBox(
                                height: AppSizes.sizedBox10.h,
                              ),
                              DefaultTextForm(
                                  textEditingController:
                                  controller.phoneNumber,
                                  textInputType: TextInputType.phone,
                                  validator: (value) => 'Uncorrect Name',
                                  label: AppTexts.enter_phone.tr),
                              SizedBox(
                                height: AppSizes.sizedBox15.h,
                              ),
                              Text(AppTexts.deadline.tr,
                                  style: context.theme.textTheme.headline3),
                              SizedBox(
                                height: AppSizes.sizedBox10.h,
                              ),
                              DefaultTextForm(
                                  onTap: ()async{
                                    controller.dateTime=(
                                        await  showDatePicker(context: context,
                                            initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate:DateTime.utc(2030)))!;
                                    controller.deadline.text='${controller.dateTime.year!}-${controller.dateTime.month!}-${controller.dateTime.day!}';
                                  },
                                  textEditingController:
                                  controller.deadline,
                                  textInputType: TextInputType.text,
                                  validator: (value) => 'Uncorrect Name',
                                  label: 'dd/mm/yyyy',
                                  hasPrefixIcon: true,
                                  iconData: Icons.calendar_month_outlined),
                              SizedBox(
                                height: AppSizes.sizedBox15.h,
                              ),
                              Text(AppTexts.amount.tr,
                                  style: context.theme.textTheme.headline3),
                              SizedBox(
                                height: AppSizes.sizedBox10.h,
                              ),
                              DefaultTextForm(
                                  textEditingController:
                                  controller.amount,
                                  textInputType: TextInputType.text,
                                  validator: (value) => 'Uncorrect Name',
                                  label: '1.200',
                                  hasPrefixIcon: true,
                                  iconData: Icons.monetization_on_outlined),
                              SizedBox(
                                height: AppSizes.sizedBox15.h,
                              ),
                              Text(AppTexts.note.tr,
                                  style: context.theme.textTheme.headline3),
                              SizedBox(
                                height: AppSizes.sizedBox10.h,
                              ),
                              DefaultTextForm(
                                  textEditingController:
                                  controller.note,
                                  textInputType: TextInputType.text,
                                  validator: (value) => 'Uncorrect Name',
                                  label: AppTexts.note.tr,
                                  hasPrefixIcon: true,
                                  iconData: Icons.note_outlined),
                              SizedBox(
                                height: AppSizes.sizedBox40.h,
                              ),
                              MaterialButton(
                                color: AppColors.primaryColor,
                                onPressed: () {
                                  controller.transaction(
                                      phoneNumber: controller
                                          .phoneNumber.text,
                                      deadLine:
                                      controller.deadline.text,
                                      amount: controller.amount.text,
                                      note: controller.note.text);
                                },
                                child: Obx((){
                                  if(controller.isLoading.value){
                                    return Center(child: CircularProgressIndicator(),);
                                  }else{
                                    return Text(AppTexts.confirm.tr);
                                  }
                                }),
                              )
/*
                                                         DefaultButton( text:AppTexts.confirm.tr,screen: RoutesClass.getProfileRoute())
*/
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ])),
        );
  }
}
