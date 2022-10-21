import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/home/controllers/homeController.dart';
import 'package:loan_app/modules/home/views/users_screen.dart';
import 'package:loan_app/shared/components/components.dart';
import 'package:loan_app/shared/components/styles/colors.dart';

import '../../../shared/components/styles/texts.dart';
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
                        child: Text('View All',style: TextStyle(
                          color: primaryColor,
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
                          name: 'John Doe',
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
                           style: smallTextStyle.copyWith(
                            fontSize: 17.sp,color: Color(0xffEBEEF2)
                          )
                          ),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.circle,color: Colors.red,size: 13,),
                                                        Text('2.000\$',
                                                         style: smallTextStyle.copyWith(
                            fontSize: 23.sp,color: Color(0xffEBEEF2)
                          )
                                                        ),
                                                      ],
                                                    ),
                                                    Text('12.Nov 2022',
                                                     style: smallTextStyle.copyWith(
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
                             Text('Cr',style: smallTextStyle.copyWith(
                                 fontSize: 17.sp,color: Color(0xffEBEEF2)
                             ),),
                             Row(
                               children: [
                                 Icon(Icons.circle,color: Colors.green,size: 13,),
                                 Text('4.000\$',
                                     style: smallTextStyle.copyWith(
                                         fontSize: 23.sp,color: Color(0xffEBEEF2)
                                     )
                                 ),
                               ],
                             ),
                             Text('12.Nov 2022',
                                 style: smallTextStyle.copyWith(
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
