import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/core/app_sizes/app_sizes.dart';
import 'package:loan_app/features/users/presenttion/controller/all_users_controller.dart';
import 'package:loan_app/core/app_images/app_images.dart';
import 'package:loan_app/core/colors/app_colors.dart';
import '../../../../core/app_texts/app_texts.dart';
import '../../../../core/widgets/shared_widgets.dart';
import '../../../loan/presenttion/pages/loan_screen.dart';

class UsersScreen extends StatelessWidget{
   UsersScreen({super.key});
   AllUsersController controller=Get.find();
  @override
  Widget build(BuildContext context) {
    print(controller.allUsersModel.data);
          return Scaffold(
              appBar: AppBar(
                backgroundColor: AppColors.primaryColor,
                elevation: 0.0,
                title: Text(AppTexts.users.tr),
                actions: [
              
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset(AppImages.filterIcon)
                      )
                ],
              ),
              backgroundColor: AppColors.primaryColor,
 
              body:SafeArea(
          top: true,
          minimum: EdgeInsets.only(top: 30.h),
          child:  Column(
            children: [

              Expanded(
                  child: Container(

                    padding: EdgeInsets.all(20.h.w),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.vertical(top: Radius.circular(55.r)),
                        color: Get.isDarkMode?AppColors.primaryTextColor:Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 40.h,
                        ),
                        DefaultTextForm(textEditingController: TextEditingController(), textInputType: TextInputType.text, validator: ((value) => ''),
                            label:AppTexts.search.tr,hasPrefixIcon: true,iconData: Icons.search),
                        SizedBox(
                          height: 30.h,
                        ),

                        Expanded(


                          child:

                       controller.obx((state){
                         return
                           ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(height: 15.h,),
                          itemBuilder: ((context, index) =>  InkWell(
                            onTap: (() => Get.to(LoanScreen())),
                            child: Container(
                              width: 335.w,
                              height: 97.5.h,
                              child: Card(

                                child: ListTile(
                                  contentPadding: EdgeInsets.all(AppSizes.padding20/2),
                                  leading: Image.asset(
                                    controller.allUsersModel.data[index].image??AppImages.profile,
                                    width: 65.w,
                                    height: 65.h,
                                  ),
                               // title: Text("${controller.allUsersModel.data[index].first_name}  ${controller.allUsersModel!.data[index].last_name}",style: context.theme.textTheme.bodyText1,),
                                  title: Text(controller.allUsersModel.data[index].phone_number!,style: context.theme.textTheme.headline2,),
                                ),
                              ),
                            ),
                          )
                          ),
                          itemCount: controller.allUsersModel.data.length,
                           );

                        },

                          onLoading: Center(child: CircularProgressIndicator()),
                          onEmpty: Center(child: Text('No Users to show',style: context.theme.textTheme.bodyText2,)),
                          onError: (_) => Center(child: Text('Somethings went wrong!',style: context.theme.textTheme.bodyText2,)),
                        ),

                        ),


                      ],
                    ),
                  )),
            ],
          ),



        ),);
        }


  }

