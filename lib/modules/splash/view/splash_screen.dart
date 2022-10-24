import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loan_app/routes/routes.dart';
import '../../../shared/colors/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 5), (){
      
      Get.offAllNamed(RoutesClass.getOnboardingRoute());
    });

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: SvgPicture.asset("assets/images/Layer 1.svg",color: Colors.white),),
    );
  }
}
