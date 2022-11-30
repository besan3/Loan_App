import 'package:get/get.dart';
import 'package:loan_app/features/auth/presenttion/bindings/auth_bindings.dart';
import 'package:loan_app/features/edit_profile/presenttion/bindings/edit_profile_binding.dart';
import 'package:loan_app/features/setting/presenttion/pages/settingsScreen.dart';
import 'package:loan_app/features/transactions/presenttion/binding/transaction_binding.dart';
import 'package:loan_app/features/users/presenttion/binding/all_users_binding.dart';
import 'package:loan_app/features/users/presenttion/pages/users_screen.dart';
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
  static String users='/users';
  static String setting='/setting';

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
  static String getUsersRoute() => users;
  static String getSettingsRoute() => setting;

  List<GetPage> routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: onboarding, page: () => OnBoarding_Screen()),
    //GetPage(name: layout, page: () => HomeLayout()),
    GetPage(name: login, page: () => LoginScreen(),binding: AuthBinding()),
  //  GetPage(name: setup, page: () =>  SetupAccountScreen(''),binding: AuthBinding()),
 //   GetPage(name: verification, page: () => VerificationScreen()),
    GetPage(name: request, page: ()=>PaymentScreen()),
   // GetPage(name: profile, page: ()=>ProfileScreen(),binding: EditProfileBinding()),
    GetPage(name: addCreditor, page: ()=>AddCreditorScreen(),bindings: [
      TransactionBinding()
    ]),
    //GetPage(name: addDebtor, page: ()=>AddDebtorScreen(),binding: TransactionBinding()),
    GetPage(name: users, page: ()=>UsersScreen(),binding: AllUsersBinding()),
    GetPage(name: setting, page: ()=>SettingScreen(),binding: EditProfileBinding()),

  ];
}
