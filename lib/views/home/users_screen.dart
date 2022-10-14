import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:loan_app/shared/components/components.dart';
import 'package:loan_app/controllers/homeController.dart';
import 'package:loan_app/viewModels/home_model.dart';

import '../../shared/components/styles/colors.dart';

class UsersScreen extends StatelessWidget {
   UsersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (homecontroller) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: primaryColor,
                elevation: 0.0,
                title: Text(homecontroller.screensTitels[homecontroller.index]),
                actions: [
              
                  IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/images/Vector (5).png')
                      )
                ],
              ),
              backgroundColor: primaryColor,
 
              body:SafeArea(
          top: true,
          minimum: EdgeInsets.only(top: 30),
          child: Column(
            children: [
             
              Expanded(
                  child: Container(
             
                padding: EdgeInsets.all(20),
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(55)),
                    color: backgroundColor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      SizedBox(
                      height: 40,
                    ),
                defaultTextForm(textEditingController: TextEditingController(), textInputType: TextInputType.text, validator: ((value) => ''), label: 'Search',hasPrefixIcon: true,iconData: Icons.search),
                    SizedBox(
                      height: 30,
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
                ),
              )),
            ],
          ),
        ),);
        });
  }
}
