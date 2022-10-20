import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/routes/routes.dart';
import 'package:loan_app/shared/components/styles/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
 const  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
       designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:
      (context , child)=> GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Loan Application',
       
        theme:
        
        
        
        
         ThemeData(
        fontFamily: 'Poppins',
    
          primarySwatch: MaterialColor(
            0xff244AD3, const <int, Color>{ 
        50: const Color(0xff244AD3 ),//10% 
        100: const Color(0xff244AD3),//20% 
        200: const Color(0xff244AD3),//30% 
        300: const Color(0xff244AD3),//40% 
        400: const Color(0xff244AD3),//50% 
        500: const Color(0xff244AD3),//60% 
        600: const Color(0xff244AD3),//70% 
        700: const Color(0xff244AD3),//80% 
        800: const Color(0xff244AD3),//90% 
        900: const Color(0xff244AD3),//100% 
      }, 
          ),
        cardColor: Colors.white,
      textTheme: TextTheme(bodyLarge: TextStyle(color: primaryTextColor))
        ),
    
    
        
        darkTheme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: primaryColor),
          textTheme: TextTheme()
        ),
       initialRoute:RoutesClass.getSplashRout() ,
        getPages: 
          RoutesClass().routes
        ,
    //    home: SplashScreen(),
      ),
    );
  }
}

