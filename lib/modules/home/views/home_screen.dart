import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/home/controllers/homeController.dart';
import 'package:loan_app/modules/users/view/users_screen.dart';
import 'package:loan_app/shared/widgets/shared_widgets.dart';
import '../../../shared/colors/app_colors.dart';
import '../models/home_model.dart';
import '../widgets/home_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {

    return GetBuilder<HomeController>(
   //   init: HomeController(),

      builder: (homecontroller)=>SafeArea(
          top: true,
          minimum: EdgeInsets.only(top: 30.h),
          child: Stack(
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
                        onTap: () =>Get.to(UsersScreen()) ,
                        child: Text('view'.tr,style: TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400
                        ),),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                    Expanded(child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(height: 15.h,),
                      itemBuilder: ((context, index) =>  HomeCard( homeModel: HomeModel(
                          image: 'assets/images/profile.png',
                          name: 'username'.tr,
                          number: '1234567890'
                      ),)
                     ),
                     itemCount: 6,
                     ),
                     )
                    ],
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
                      Color(0xff6783EA),
                      Color(0xff62349D),
                    ],
                  )),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                    children: [
                      Column(                           mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text('Dr',
                           style: context.theme.textTheme.subtitle1?.copyWith(
                            fontSize: 17.sp,color: Color(0xffEBEEF2)
                          )
                          ),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.circle,color: Colors.red,size: 13,),
                                                        Text('2.000\$',
                                                         style:  context.theme.textTheme.subtitle1?.copyWith(
                            fontSize: 23.sp,color: Color(0xffEBEEF2)
                          )
                                                        ),
                                                      ],
                                                    ),
                                                    Text('12.Nov 2022',
                                                     style:  context.theme.textTheme.subtitle1?.copyWith(
                            fontSize: 14.sp,color: Color(0xffEBEEF2)
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
                                 fontSize: 17.sp,color: Color(0xffEBEEF2)
                             ),),
                             Row(
                               children: [
                                 Icon(Icons.circle,color: Colors.green,size: 13,),
                                 Text('4.000\$',
                                     style: context.theme.textTheme.subtitle1?.copyWith(
                                         fontSize: 23.sp,color: Color(0xffEBEEF2)
                                     )
                                 ),
                               ],
                             ),
                             Text('12.Nov 2022',
                                 style:context.theme.textTheme.subtitle1?.copyWith(
                                     fontSize: 14.sp,color: Color(0xffEBEEF2)
                                 )
                             ),

                           ],
                         )
                    ],
                  ),
            ),
          ]),
        ),
      
    );
  }
}
