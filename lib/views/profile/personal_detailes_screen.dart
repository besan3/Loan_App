import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/shared/components/components.dart';
import 'package:loan_app/views/home/home_screen.dart';
import 'package:loan_app/views/home/layout.dart';

import '../../shared/components/styles/colors.dart';

class PersonalDetailsScreen extends StatelessWidget {
  const PersonalDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
     
        elevation: 0.0,
        leading:
          IconButton(
            icon: Icon(Icons.arrow_back,color: primaryTextColor,),
            onPressed: (() => Navigator.pop(context)),
          ),
        
        title: Text('My Profile',style: TextStyle(color: primaryTextColor,fontSize: 20,fontWeight: FontWeight.w600),),
        backgroundColor: Color.fromARGB(255, 252, 250, 250),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade400,
                    child: Image.asset('assets/images/Path 66.png',
                    width: 15,
                    height: 15,),
                  ),
                ),
          
                SizedBox(height: 16,),
          
          
                Text('John Doe',
                      style: TextStyle(
                        color: primaryTextColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                       Text('1234567890',
                      style: TextStyle(
                        color: Color(0xff95989A),
                        fontSize: 16,
                        fontWeight: FontWeight.w400
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
                                            
      defaultButton('Save Changes',  context: context,screen:RoutesClass.getLayoutRoute()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}