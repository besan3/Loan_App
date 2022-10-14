import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:loan_app/shared/components/components.dart';
import 'package:loan_app/views/home/home_screen.dart';
import 'package:loan_app/views/home/layout.dart';

import '../../shared/components/styles/colors.dart';

class SetupAccountScreen extends StatelessWidget {
  const SetupAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset('assets/images/Group 6.png',
                  width: 155,
                  height: 125,),
                ),
          
                SizedBox(height: 16,),
          
          
                Text('Setup your account',
                      style: TextStyle(
                      //  color: backgroundColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                                    SizedBox(height: 25,),
          
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 15),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Full Name',
                                          style: TextStyle(color: Color(0xff474F55),
                                          fontSize: 16,fontWeight: FontWeight.w400
                                          ),),
                                             SizedBox(height: 10,),
                                   
               Row(
                
                 children: [
                   Container(
                    width: 148,
                    height: 54,
                     child: defaultTextForm(textEditingController: TextEditingController(),
                                                       textInputType: TextInputType.text, 
                                                       validator:(value) => 'Uncorrect Name',
                                                       label: 'First Name'),
                   ),
                   SizedBox(width: 10,),
                    Container(
                width: 148,
                height: 54,
                 child: defaultTextForm(textEditingController: TextEditingController(),
                                                   textInputType: TextInputType.text, 
                                                   validator:(value) => 'Uncorrect Name',
                                                   label: 'Last Name'),
               ),
                 ],
               ),
                  SizedBox(height: 15,),
Text('Email',
                                            style: TextStyle(color: Color(0xff474F55),
                                            fontSize: 16,fontWeight: FontWeight.w400
                                            ),),
                                             SizedBox(height: 10,),
                                            defaultTextForm(textEditingController: TextEditingController(),
                                                     textInputType: TextInputType.emailAddress, 
                                                     validator:(value) => 'Uncorrect Name',
                                                     label: 'Enter your email address'),
                                                      SizedBox(height: 15,),
                                             
                                   
                                             Text('Date of birth',
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
                                   
                                  
                                             Text('Address',
                                            style: TextStyle(color: Color(0xff474F55),
                                            fontSize: 16,fontWeight: FontWeight.w400
                                            ),),
                                             SizedBox(height: 10,),
                                            defaultTextForm(textEditingController: TextEditingController(),
                                                     textInputType: TextInputType.text, 
                                                     validator:(value) => 'Uncorrect Name',
                                                     label: 'Gaza',
                                                     hasPrefixIcon: true,
                                                     iconData: Icons.location_on_outlined
                                                     ),
                                        ],
                                      ),
                                    ),
                                                SizedBox(height: 34,),
                                            
      defaultButton( 'Continue',
      context: context,screen: HomeLayout()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}