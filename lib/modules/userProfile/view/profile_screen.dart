import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/modules/userProfile/controller/profile_controller.dart';
import '../../../shared/colors/app_colors.dart';
import 'package:loan_app/shared/widgets/shared_widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
init: ProfileController(),
builder: (profilecontroller)=>Scaffold(
appBar: AppBar(
  elevation: 0.0,
  leading:
          IconButton(
            icon: Icon(Icons.arrow_back,color: AppColors.primaryTextColor,),
            onPressed: (() => Navigator.pop(context)),
          ),
        backgroundColor: Color.fromARGB(255, 252, 250, 250),
),
body: Column(
  children: [
    Padding(
      padding:  EdgeInsets.all(20.0.h.w),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [

          Column(
            children: [
              SizedBox(height: 60.h,)
,              Container(
                height: 458.h,
                child: Card(
                  child: Padding(
                    padding:  EdgeInsets.all(30.0.h.w),
                    child: Column(
                      children: [
                        Expanded(child: ListView.builder(itemBuilder: (context,index)=>
                        ListTile(
                            title: Text(profilecontroller.profileInfoTitels[index].tr),
                            subtitle: Text(profilecontroller.profileInfo[index].tr),

                        ),
                        physics: BouncingScrollPhysics(),
                        itemCount: profilecontroller.profileInfo.length,
                        ),

                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        Container(
          width: 120.w,height: 120.h,
          
          child: Image.asset('assets/images/profile.png',fit: BoxFit.cover,))
        ],
      ),
    ),

    Padding(
      padding:  EdgeInsets.all(20.0.h.w),
      child: DefaultCard(text: 'button7'.tr),
    )
  ],
),
),

    );
  }
}