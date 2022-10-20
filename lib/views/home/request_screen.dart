import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:loan_app/controllers/homeController.dart';
import 'package:loan_app/views/profile/profile_screen.dart';

import '../../shared/components/components.dart';
import '../../shared/components/styles/colors.dart';

class RequestScreen extends StatelessWidget {
  const RequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (requestcontroller) => Scaffold(
              backgroundColor: primaryColor,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: primaryColor,
                title: Text('Request'),
              ),
              body: SafeArea(
                  top: true,
                  minimum: EdgeInsets.only(top: 30),
                  child: Column(children: [
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.all(20),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(55)),
                          color: backgroundColor),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                                                                       SizedBox(height: 30,),

                          Text('Phone number',
                                              style: TextStyle(color: Color(0xff474F55),
                                              fontSize: 16,fontWeight: FontWeight.w400
                                              ),),
                                               SizedBox(height: 10,),
                                              defaultTextForm(textEditingController: TextEditingController(),
                                                       textInputType: TextInputType.phone, 
                                                       validator:(value) => 'Uncorrect Name',
                                                       label: 'Enter your Phone number'),
                                                        SizedBox(height: 15,),
                                               
                                     
                                               Text('Deadline',
                                              style: TextStyle(color: Color(0xff474F55),
                                              fontSize: 16,fontWeight: FontWeight.w400
                                              ),),
                                               SizedBox(height: 10,),
                                              defaultTextForm(textEditingController: TextEditingController(),
                                                       textInputType: TextInputType.text, 
                                                       validator:(value) => 'Uncorrect Name',
                                                       label: 'dd/mm/yyyy',
                                                         hasPrefixIcon: true,
                                                       iconData: Icons.calendar_month_outlined),
                                                        SizedBox(height: 15,),
                                     
                                    
                                               Text('Amount',
                                              style: TextStyle(color: Color(0xff474F55),
                                              fontSize: 16,fontWeight: FontWeight.w400
                                              ),),
                                               SizedBox(height: 10,),
                                              defaultTextForm(textEditingController: TextEditingController(),
                                                       textInputType: TextInputType.text, 
                                                       validator:(value) => 'Uncorrect Name',
                                                       label: '1.200',
                                                       hasPrefixIcon: true,
                                                       iconData: Icons.monetization_on_outlined
                                                       ),
                                               SizedBox(height: 40,),

                                               //        defaultButton( 'Confirm',context: context,screen: ProfileScreen())
                        ],
                      ),
                    ),),
                    
                    ),


                  ])),
            ));
  }
}
