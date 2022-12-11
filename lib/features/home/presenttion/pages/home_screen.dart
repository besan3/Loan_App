import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/core/routes/routes.dart';
import 'package:loan_app/features/home/presenttion/controller/homeController.dart';
import 'package:loan_app/features/loan/presenttion/pages/loan_screen.dart';
import 'package:loan_app/features/users/presenttion/controller/all_users_controller.dart';
import 'package:loan_app/features/users/presenttion/pages/users_screen.dart';
import 'package:loan_app/core/app_images/app_images.dart';
import 'package:loan_app/core/app_sizes/app_sizes.dart';
import '../../../../core/widgets/shared_widgets.dart';
import 'package:loan_app/core/colors/app_colors.dart';
import '../../../../core/app_texts/app_texts.dart';
import '../../models/home_model.dart';
import '../widgets/home_widget.dart';

class HomeScreen extends GetView<AllUsersController> {
  //AllUsersController controller=Get.find();
  @override
  Widget build(BuildContext context) {
   // controller.getCard();
    // controller.getUsers();
print(    controller.cardEntity.toString()
);
    return GetBuilder<AllUsersController>(
      builder:(controller) {

        return SafeArea(
            top: true,
            minimum: EdgeInsets.only(top: 30.h),
            child:
          Stack(
              alignment: AlignmentDirectional.topCenter,
             children: [
              Column(
                children: [
                  SizedBox(height: 40.h,),
               DefaultContainer(
                 Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 85.h,
                        ),
                        InkWell(
                          onTap: (){
                            Get.toNamed(RoutesClass.users);

                            },
                          child: Text(AppTexts.view.tr,style: context.theme.textTheme.headline2?.copyWith(color: AppColors.primaryColor)),
                        ),
                        SizedBox(
                          height: AppSizes.sizedBox15.h,
                        ),
                 controller.obx((state){
                   return
                     Expanded(
                       child: ListView.separated(
                         separatorBuilder: (context, index) => SizedBox(height: 15.h,),
                         itemBuilder: ((context, index) =>  InkWell(
                           onTap: (() => Get.to(const LoanScreen())),
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
                       ),
                     );

                 },
                   onLoading: Center(child: CircularProgressIndicator()),
                   onEmpty: Center(child: Text('No Users to show',style: context.theme.textTheme.bodyText2,)),
                   onError: (_) => Center(child: Text('Somethings went wrong!',style: context.theme.textTheme.bodyText2,)),

                   /*      GetBuilder<AllUsersController>(
                          builder:(controller)=>   ListView.separated(
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
                          )
                      ),*/
/*
                      Expanded(child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(height:  AppSizes.sizedBox15.h,),
                        itemBuilder: ((context, index) =>  HomeCard( homeModel: HomeModel(
                            image: AppImages.profile,
                            //homecontroller.usersModel?.data![index].image,

                            name: AppTexts.username.tr,
                           // homecontroller.usersModel?.data![index].firstName
                            number:AppTexts.number.tr
                            //homecontroller.usersModel?.data![index].phoneNumber
                        ),)
                       ),
                       itemCount: 6,
                       ),
                       )*/
                 )],
                    ),)

                  ,
                ],
              ),
              Container(
                 height: 153.h,
             //   padding: EdgeInsets.all(20.h.w),
                width: 301.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular((20.r)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      // stops: [0.4, 0.5],
                      tileMode: TileMode.clamp,

                      colors: [
                     AppColors.gradint1Color,
                        AppColors.gradint2Color
                      ],
                    )),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Column(                           mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Text('Dr',
                             style: context.theme.textTheme.subtitle1?.copyWith(
                              fontSize: 17.sp,color: AppColors.subtitleColor
                            )
                            ),
                                                      Row(
                                                        children: [
                                                          Icon(Icons.circle,color: Colors.red,size: 13,),
                                                          Text(controller.cardEntity.data!.nearDebitor?.amountDebt.toString()??'',
                                                           style:  context.theme.textTheme.subtitle1?.copyWith(
                              fontSize: 23.sp,color: AppColors.subtitleColor
                            )
                                                          ),
                                                        ],
                                                      ),
                                                      Text("${controller.dateTime.day}-${controller.dateTime.month}-${controller.dateTime.year}",
                                                       style:  context.theme.textTheme.subtitle1?.copyWith(
                              fontSize: 14.sp,color: AppColors.subtitleColor
                            )
                                                      ),

                          ],
                        ),
                        VerticalDivider(
                          thickness: 1,
                        ),
                           Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Text('Cr',style:context.theme.textTheme.subtitle1?.copyWith(
                                   fontSize: 17.sp,color:AppColors.subtitleColor
                               ),),
                               Row(
                                 children: [
                                   Icon(Icons.circle,color: Colors.green,size: 13,),


                                        Text(controller.cardEntity.data!.nearCreditor?.amountDebt.toString()??'',
                                         style: context.theme.textTheme.subtitle1?.copyWith(
                                             fontSize: 23.sp,color:AppColors.subtitleColor
                                         )

                                   ),
                                 ],
                               ),
                               Text("${controller.dateTime.day}-${controller.dateTime.month}-${controller.dateTime.year}",
                                   style:context.theme.textTheme.subtitle1?.copyWith(
                                       fontSize: 14.sp,color:AppColors.subtitleColor
                                   )
                               ),

                             ],
                           )
                      ],
                    ),
              ),
            ]),


      );
      },
    );
  }
}
