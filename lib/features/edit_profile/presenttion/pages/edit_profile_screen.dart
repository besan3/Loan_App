import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loan_app/core/app_images/app_images.dart';
import 'package:loan_app/core/app_sizes/app_sizes.dart';
import 'package:loan_app/features/edit_profile/domain/entities/edit_profile_data.dart';
import 'package:loan_app/features/edit_profile/presenttion/controller/edit_profile_controller.dart';
import '../../../../core/widgets/shared_widgets.dart';
import 'package:loan_app/core/colors/app_colors.dart';
import 'package:loan_app/core/routes/routes.dart';
import '../../../../core/app_texts/app_texts.dart';

class PersonalDetailsScreen extends GetView<EditProfileController> {
  var formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Get.isDarkMode ? Colors.white : AppColors.primaryTextColor,
          ),
          onPressed: (() => Navigator.pop(context)),
        ),
        title: Text(AppTexts.my_profile.tr),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(AppSizes.padding20.h.w),
          child: SingleChildScrollView(
            child:

               Form(
                 key: formKey,
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: CircleAvatar(
                        radius: AppSizes.radius50.r,
                        backgroundColor: Colors.grey.shade400,
                        child: Stack(
                          children: [

                            IconButton(
                              onPressed: () => controller.pickImg(),
                              icon: Image.asset(
                                AppImages.camera,
                                width: AppSizes.radius15.w,
                                height: AppSizes.radius15.h,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.radius15.h,
                    ),
                    Text(AppTexts.username.tr,
                        style: context.theme.textTheme.bodyText1),
                    Text(AppTexts.number.tr,
                        style: context.theme.textTheme.headline4),
                    SizedBox(
                      height: AppSizes.sizedBox25.h,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: AppSizes.radius15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppTexts.full_name.tr,
                              style: context.theme.textTheme.headline3),
                          SizedBox(
                            height: AppSizes.sizedBox10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: AppSizes.containerWidth.w,
                                height: AppSizes.containerheight.h,
                                child: DefaultTextForm(
                                    textEditingController:
                                        TextEditingController(),
                                    textInputType: TextInputType.text,
                                    validator: (String? value) {
                                      if(value!.isEmpty) {
                                        return 'Enter your email address';
                                      }
                                    },
                                    label: AppTexts.first_name.tr),
                              ),
                              Container(
                                width: AppSizes.containerWidth.w,
                                height: AppSizes.containerheight.h,
                                child: DefaultTextForm(
                                    textEditingController:
                                        TextEditingController(),
                                    textInputType: TextInputType.text,
                                    validator: (value) => 'Uncorrect Name',
                                    label: AppTexts.last_name.tr),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: AppSizes.radius15.h,
                          ),
                          Text(
                            AppTexts.email.tr,
                            style: context.theme.textTheme.headline3,
                          ),
                          SizedBox(
                            height: AppSizes.sizedBox10.h,
                          ),
                          DefaultTextForm(
                              textEditingController: TextEditingController(),
                              textInputType: TextInputType.emailAddress,
                              validator: (value) => 'Uncorrect Name',
                              label: AppTexts.email.tr),
                          SizedBox(
                            height: AppSizes.radius15.h,
                          ),
                          Text(
                            AppTexts.dOb.tr,
                            style: context.theme.textTheme.headline3,
                          ),
                          SizedBox(
                            height: AppSizes.sizedBox10.h,
                          ),
                          DefaultTextForm(
                              onTap: ()async{
                                controller.dateTime=(
                                    await  showDatePicker(context: context,
                                        initialDate: DateTime.now(), firstDate: DateTime.utc(1980), lastDate:DateTime.now()))!;
                                controller.dObController.text='${controller.dateTime.year!}-${controller.dateTime.month!}-${controller.dateTime.day!}';
                              },
                              textEditingController: controller.dObController,
                              textInputType: TextInputType.text,
                              validator: (value) => 'Uncorrect Name',
                              label: 'dd/mm/yyyy',
                              hasPrefixIcon: true,
                              iconData: Icons.calendar_month_outlined
                          ),
                          SizedBox(
                            height: AppSizes.radius15.h,
                          ),
                          Text(AppTexts.address.tr,
                              style: context.theme.textTheme.headline3),
                          SizedBox(
                            height: AppSizes.sizedBox10.h,
                          ),
                          DefaultTextForm(onTap: ()async{
                            controller.position=await controller.getLatAndLang();
                            List<Placemark> placemarks = await placemarkFromCoordinates(controller.position.latitude,controller.position.longitude);
                            print('longitude:${controller.position.longitude}');
                            print('latitude:${controller.position.latitude}');
                            print(placemarks);
                            controller.addressController.text=placemarks[0].name!;
                            controller.address1Controller.text=placemarks[0].street!;
                            controller.address2Controller.text=placemarks[0].thoroughfare!;

                            controller.addressController.text=controller.addressController.text+","+controller.address1Controller.text+","+controller.address2Controller.text;
                          },
                              textEditingController: controller.addressController,
                              textInputType: TextInputType.text,
                              validator: (value) => 'Uncorrect Name',
                              label: AppTexts.gaza.tr,
                              hasPrefixIcon: true,
                              iconData: Icons.location_on_outlined),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: AppSizes.sizedBox34.h,
                    ),
                   // controller.obx((state)=>(
                     MaterialButton(
                       color: AppColors.primaryColor,
                          onPressed: () => controller.editProfile(
                              phone_number: controller.phoneController.text,
                              first_name: controller.fNameController.text,
                              last_name: controller.lNameController.text,
                              email: controller.emailController.text,
                              address_line1: controller.address1Controller.text,
                              address_line2: controller.address2Controller.text,
                              address: controller.addressController.text,
                              image: controller.imageController.text,
                              date_of_birth: controller.dObController.text,
                             ),
                      child:Text(AppTexts.save_changes.tr,style: context.theme.textTheme.headline5,),
                        //onLoading: Center(child: CircularProgressIndicator()),

                      ),


                  //  ),
                      //onLoading: Center(child: CircularProgressIndicator()),

                   // )
                  ],
              ),
               ),
            ),
          ),
        ),
      );

  }
}
