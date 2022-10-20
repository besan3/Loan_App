import 'package:get/get.dart';
import 'package:loan_app/views/home/home_screen.dart';
import 'package:loan_app/views/home/layout.dart';
import 'package:loan_app/views/home/request_screen.dart';
import 'package:loan_app/views/home/splash_screen.dart';
import 'package:loan_app/views/login/login_screen.dart';
import 'package:loan_app/views/login/setup_account_screen.dart';
import 'package:loan_app/views/login/verifecation_code_screen.dart';
import 'package:loan_app/views/onboarding/onboarding_screen.dart';

class RoutesClass {
  static String splash = '/splash';
  static String onboarding = '/onboarding';
  static String layout = '/';
  static String login = '/login';
  static String setup = '/setup';
  static String verification= '/verification';
  static String request= '/request';

  static String getSplashRout() => splash;
  static String getLayoutRoute() => layout;
  static String getOnboardingRoute() => onboarding;
  static String getLoginRoute() => login;
  static String getSetupAccountRoute() => setup;
  static String getVerificationRoute() => verification;
  static String getRequestRoute() => request;

  List<GetPage> routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: onboarding, page: () => OnBoarding_Screen()),
    GetPage(name: layout, page: () => HomeLayout()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: setup, page: () => SetupAccountScreen()),
        GetPage(name: verification, page: () => VerificationScreen()),
    GetPage(name: request, page: ()=>RequestScreen()),

  ];
}
