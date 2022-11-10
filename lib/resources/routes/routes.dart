

import 'package:get/get.dart';
import 'package:loan_app/modules/auth/setup/view/setup_account_screen.dart';
import 'package:loan_app/modules/auth/verification/view/verifecation_code_screen.dart';
import 'package:loan_app/modules/layout/view/layout.dart';
import 'package:loan_app/modules/onboarding/view/onboarding_screen.dart';
import 'package:loan_app/modules/request/view/payment_screen.dart';
import 'package:loan_app/modules/splash/view/splash_screen.dart';
import 'package:loan_app/modules/transactions/creditor/creditor_view.dart';
import 'package:loan_app/modules/transactions/debtor/dedtor_view.dart';
import 'package:loan_app/modules/userProfile/view/profile_screen.dart';
import 'package:loan_app/resources/middleware/middleware.dart';

import '../../modules/auth/login/view/login_screen.dart';

class RoutesClass {
  static String splash = '/splash';
  static String onboarding = '/onboarding';
  static String layout = '/layout';
  static String login = '/login';
  static String setup = '/setup';
  static String verification= '/verification';
  static String request= '/request';
  static String profile='/profile';
  static String addCreditor='/addCreditor';
  static String addDebtor='/addDebtor';

  static String getSplashRout() => splash;
  static String getLayoutRoute() => layout;
  static String getOnboardingRoute() => onboarding;
  static String getLoginRoute() => login;
  static String getSetupAccountRoute() => setup;
  static String getVerificationRoute(String text) => verification;
  static String getRequestRoute() => request;
  static String getProfileRoute() => profile;
  static String getAddCreditorRoute() => addCreditor;
  static String getAddDebtorRoute() => addDebtor;

  List<GetPage> routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: onboarding, page: () => OnBoarding_Screen()),
    GetPage(name: layout, page: () => HomeLayout()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: setup, page: () => const SetupAccountScreen()),
 //   GetPage(name: verification, page: () => VerificationScreen()),
    GetPage(name: request, page: ()=>PaymentScreen()),
    GetPage(name: profile, page: ()=>ProfileScreen()),
    GetPage(name: addCreditor, page: ()=>AddCreditorScreen()),
    GetPage(name: addDebtor, page: ()=>AddDebtorScreen()),

  ];
}
