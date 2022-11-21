import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:loan_app/core/app_images/app_images.dart';
import 'package:loan_app/core/app_sizes/app_sizes.dart';
import 'package:loan_app/core/routes/routes.dart';
import '../../../../core/app_texts/app_texts.dart';
import '../../../../core/colors/app_colors.dart';
import '../../../../core/widgets/shared_widgets.dart';
import '../controller/setup_controller.dart';

class SetupAccountScreen extends StatelessWidget {
  const SetupAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SetUpController>(
      init: SetUpController(),
      builder:(setupController)=> Scaffold(
        body: SafeArea(
          child: Padding(
            padding:  EdgeInsets.all(AppSizes.padding20.h.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(AppImages.setup,
                    width: AppSizes.setupImageWidth.w,
                    height: AppSizes.setupImageheight.h,),
                  ),
/*
MaterialButton(
  color: AppColors.primaryTextColor,
  onPressed: ()async{
    setupController.position=await setupController.getLatAndLang();
    List<Placemark> placemarks = await placemarkFromCoordinates(setupController.position.latitude, setupController.position.longitude);
  print('longitude:${setupController.position.longitude}');
  print('latitude:${setupController.position.latitude}');
  print(placemarks[0].country);
},
child: Text('position'),
),
*/
                  SizedBox(height: AppSizes.sizedBox16.h,),


                  Text(AppTexts.setup.tr,
                        style: context.theme.textTheme.bodyText1
                        ),
                                      SizedBox(height: AppSizes.sizedBox25.h,),

                                      Padding(
                                        padding:  EdgeInsets.symmetric(horizontal: AppSizes.sizedBox15.w),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(AppTexts.full_name.tr,
                                            style:  context.theme.textTheme.headline3,
                                           ),
                                               SizedBox(height: AppSizes.radius10.h,),

                 Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                       width: AppSizes.containerWidth.w,
                       height: AppSizes.containerheight.h,
                       child: DefaultTextForm(textEditingController: setupController.firstNameController,
                                                         textInputType: TextInputType.text,
                           validator: (String? value) {
                             if(value!.isEmpty) {
                               return 'Please Enter your First Name';
                             }
                           },
                                                         label: AppTexts.first_name.tr),
                     ),
                      Container(
                  width: AppSizes.containerWidth.w,
                  height: AppSizes.containerheight.h,
                   child: DefaultTextForm(textEditingController: setupController.lastNameController,
                                                     textInputType: TextInputType.text,
                       validator: (String? value) {
                         if(value!.isEmpty) {
                           return 'Please Enter your Last Name';
                         }
                       },
                                                     label: AppTexts.last_name.tr),
                 ),
                   ],
                 ),
                    SizedBox(height: AppSizes.sizedBox15.h,),
Text(AppTexts.email.tr,
                                              style: context.theme.textTheme.headline3,),
                                               SizedBox(height: AppSizes.radius10.h,),
                                            DefaultTextForm(textEditingController: setupController.emailController,
                                                       textInputType: TextInputType.emailAddress,
                                                validator: (String? value) {
                                                  if(value!.isEmpty) {
                                                    return 'Please Enter your email address';
                                                  }
                                                },
                                                       label: AppTexts.email.tr),
                                                        SizedBox(height: AppSizes.sizedBox15.h,),


                                               Text(AppTexts.dOb.tr,
                                              style: context.theme.textTheme.headline3,),
                                               SizedBox(height: AppSizes.radius10.h,),
                                            DefaultTextForm(
                                                onTap: ()async{
                                            setupController.dateTime=(
                                                await  showDatePicker(context: context,
                                                      initialDate: DateTime.now(), firstDate: DateTime.utc(1980), lastDate:DateTime.now()))!;
                                            setupController.dObController.text='${setupController.dateTime.year!}-${setupController.dateTime.month!}-${setupController.dateTime.day!}';
                                                },
                                                textEditingController: setupController.dObController,
                                                       textInputType: TextInputType.text,
                                                       validator:(value) => 'Uncorrect Name',
                                                       label: AppTexts.date.tr,
                                                         hasPrefixIcon: true,
                                                       iconData: Icons.calendar_month_outlined),
                                            SizedBox(height: AppSizes.sizedBox15.h,),


                                               Text(AppTexts.location.tr,
                                              style: context.theme.textTheme.headline3),
                                               SizedBox(height: AppSizes.radius10.h,),
                                            DefaultTextForm(onTap: ()async{
                                              setupController.position=await setupController.getLatAndLang();
                                              List<Placemark> placemarks = await placemarkFromCoordinates(setupController.position.latitude,setupController.position.longitude);
                                              print('longitude:${setupController.position.longitude}');
                                              print('latitude:${setupController.position.latitude}');
                                              print(placemarks);
                                              setupController.locationController.text=placemarks[0].name!+","+placemarks[0].street!+","+placemarks[0].thoroughfare!;
                                            },
                                                textEditingController: setupController.locationController,
                                                       textInputType: TextInputType.text,
                                                       validator:(value) => 'Uncorrect Name',
                                                       label: AppTexts.location.tr,
                                                       hasPrefixIcon: true,
                                                       iconData: Icons.location_on_outlined
                                                       ),

                                          ],
                                        ),
                                      ),
                  SizedBox(height: AppSizes.sizedBox36.h,),
                  MaterialButton(
                    onPressed: () {
                      setupController.setup(
                          firstName:setupController.firstNameController.text ,
                          lastName: setupController.lastNameController.text,
                          email: setupController.emailController.text,
                          dob: setupController.dObController.text,
                          address: setupController.locationController.text,

                      );
                      Get.offAllNamed(RoutesClass.getLayoutRoute());
                    },
                    padding: EdgeInsets.all(20),
                    color: AppColors.primaryColor,
                    minWidth: double.infinity,
                    child: Text(
                      AppTexts.continuebutton.tr,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}