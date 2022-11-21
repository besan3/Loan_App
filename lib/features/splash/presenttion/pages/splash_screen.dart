import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loan_app/core/app_images/app_images.dart';
import 'package:loan_app/core/colors/app_colors.dart';
import 'package:loan_app/core/routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 5), (){
      
      Get.offAllNamed(RoutesClass.getOnboardingRoute());
    });

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(child: SvgPicture.asset(AppImages.splashLogo,color: Colors.white),),
    );
  }
}
