import 'package:get/get.dart';

import '../modules/auth/login/view/login_screen.dart';
import '../modules/auth/setup/view/setup_account_screen.dart';
import '../modules/auth/verification/view/verifecation_code_screen.dart';
import '../modules/home/views/layout.dart';
import '../modules/home/views/request_screen.dart';
import '../modules/home/views/splash_screen.dart';
import '../modules/onboarding/view/onboarding_screen.dart';
import '../modules/profile/profile/view/profile_screen.dart';

class RoutesClass {
  static String splash = '/splash';
  static String onboarding = '/onboarding';
  static String layout = '/';
  static String login = '/login';
  static String setup = '/setup';
  static String verification= '/verification';
  static String request= '/request';
  static String profile='/profile';

  static String getSplashRout() => splash;
  static String getLayoutRoute() => layout;
  static String getOnboardingRoute() => onboarding;
  static String getLoginRoute() => login;
  static String getSetupAccountRoute() => setup;
  static String getVerificationRoute() => verification;
  static String getRequestRoute() => request;
  static String getProfileRoute() => profile;

  List<GetPage> routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: onboarding, page: () => OnBoarding_Screen()),
    GetPage(name: layout, page: () => HomeLayout()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: setup, page: () => SetupAccountScreen()),
        GetPage(name: verification, page: () => VerificationScreen()),
    GetPage(name: request, page: ()=>RequestScreen()),
    GetPage(name: profile, page: ()=>ProfileScreen())

  ];
}
