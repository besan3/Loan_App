import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/shared/components/components.dart';
import 'package:loan_app/shared/components/styles/colors.dart';
import 'package:loan_app/controllers/homeController.dart';
import 'package:loan_app/views/home/users_screen.dart';

import '../../models/home_model.dart';
import '../../shared/components/styles/texts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  HomeModel homeModel=HomeModel();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),

      builder: (homecontroller)=>SafeArea(
          top: true,
          minimum: EdgeInsets.only(top: 30),
          child: Stack(
            alignment: AlignmentDirectional.topCenter,
           children: [
            Column(
              children: [
                SizedBox(height: 40,),
             defaultContainer(Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 85,
                      ),
                      InkWell(
                        onTap: () =>Get.to(UsersScreen()) ,
                        child: Text('View All',style: TextStyle(
                          color: primaryColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400
                        ),),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    Expanded(child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(height: 15,),
                      itemBuilder: ((context, index) =>  defaultCard(HomeModel(
                      image: 'assets/images/profile.png',
                      name: 'John Doe',
                      number: '1234567890'
                     ))
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
              height: 153,
              padding: EdgeInsets.all(20),
              width: 301,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular((20)),
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
                      Column(
                        children: [
                          Text('Dr',
                           style: smallTextStyle.copyWith(
                            fontSize: 17,color: Color(0xffEBEEF2)
                          )
                          ),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.circle,color: Colors.red,size: 13,),
                                                        Text('2.000\$',
                                                         style: smallTextStyle.copyWith(
                            fontSize: 23,color: Color(0xffEBEEF2)
                          )
                                                        ),
                                                      ],
                                                    ),
                                                    Text('12.Nov 2022',
                                                     style: smallTextStyle.copyWith(
                            fontSize: 14,color: Color(0xffEBEEF2)
                          )
                                                    ),

                        ],
                      ),
                      VerticalDivider(
                        thickness: 1,
                      ),
                         Column(
                        children: [
                          Text('Cr',style: smallTextStyle.copyWith(
                            fontSize: 17,color: Color(0xffEBEEF2)
                          ),),
                                                    Row(
                                                      children: [
                                                        Icon(Icons.circle,color: Colors.green,size: 13,),
                                                        Text('4.000\$',
                                                        style: smallTextStyle.copyWith(
                            fontSize: 23,color: Color(0xffEBEEF2)
                          )
                                                        ),
                                                      ],
                                                    ),
                                                    Text('12.Nov 2022',
                                                    style: smallTextStyle.copyWith(
                            fontSize: 14,color: Color(0xffEBEEF2)
                          )
                                                    ),

                        ],
                      ),
                    ],
                  ),
            ),
          ]),
        ),
      
    );
  }
}
