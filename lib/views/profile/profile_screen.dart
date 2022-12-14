import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:loan_app/controllers/homeController.dart';
import 'package:loan_app/shared/components/components.dart';

import '../../shared/components/styles/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
init: HomeController(),
builder: (profilecontroller)=>Scaffold(
appBar: AppBar(
  elevation: 0.0,
  leading:
          IconButton(
            icon: Icon(Icons.arrow_back,color: primaryTextColor,),
            onPressed: (() => Navigator.pop(context)),
          ),
        backgroundColor: Color.fromARGB(255, 252, 250, 250),
),
body: Column(
  children: [
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [

          Column(
            children: [
              SizedBox(height: 60,)
,              Container(
                height: 458,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Expanded(child: ListView.builder(itemBuilder: (context,index)=>
                    ListTile(
                        title: Text(profilecontroller.profileInfoTitels[index]),
                        subtitle: Text(profilecontroller.profileInfo[index]),
                      
                    ),
                    physics: BouncingScrollPhysics(),
                    itemCount: profilecontroller.profileInfo.length,
                    ),
                    
                    ),
                  ),
                ),
              ),
            ],
          ),
        Container(
          width: 120,height: 120,
          
          child: Image.asset('assets/images/profile.png',fit: BoxFit.cover,))
        ],
      ),
    ),

    Padding(
      padding: const EdgeInsets.all(20.0),
      child: defaultButton('Send Message'),
    )
  ],
),
),

    );
  }
}