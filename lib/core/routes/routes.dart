import 'package:get/get.dart';
import '../../features/auth/presenttion/pages/login_screen.dart';
import '../../features/auth/presenttion/pages/setup_account_screen.dart';
import '../../features/layout/presenttion/pages/layout.dart';
import '../../features/onboarding/presenttion/pages/onboarding_screen.dart';
import '../../features/request/presenttion/pages/payment_screen.dart';
import '../../features/splash/presenttion/pages/splash_screen.dart';
import '../../features/transactions/presenttion/pages/creditor_view.dart';
import '../../features/transactions/presenttion/pages/dedtor_view.dart';
import '../../features/userProfile/presenttion/pages/profile_screen.dart';

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
