import 'package:camp_finder/app/ui/global_widgets/bottom_navigation/root_binding.dart';
import 'package:camp_finder/app/ui/global_widgets/bottom_navigation/root_page.dart';
import 'package:camp_finder/app/ui/modules/camping/camping_binding.dart';
import 'package:camp_finder/app/ui/modules/camping/camping_page.dart';
import 'package:camp_finder/app/ui/modules/forgot_password/forgot_password_binding.dart';
import 'package:camp_finder/app/ui/modules/forgot_password/forgot_password_page.dart';
import 'package:camp_finder/app/ui/modules/home/home_binding.dart';
import 'package:camp_finder/app/ui/modules/home/home_page.dart';
import 'package:camp_finder/app/ui/modules/login/login_binding.dart';
import 'package:camp_finder/app/ui/modules/login/login_page.dart';
import 'package:camp_finder/app/ui/modules/register_new_customer/register_new_customer_binding.dart';
import 'package:camp_finder/app/ui/modules/register_new_customer/register_new_customer_page.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.BOTTOM_NAVIGATION,
      page: () => RootPage(),
      binding: RootBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.CAMPING_FINDER_PAGE,
      page: () => CampingPage(),
      binding: CampingBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.LOGIN_PAGE,
      page: () => LoginPage(),
      binding: LoginBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.REGISTER_PAGE,
      page: () => RegisterNewCustomerPage(),
      binding: RegisterNewCustomerBinding(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: AppRoutes.FORGOT_PASSWORD_PAGE,
      page: () => ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
      transition: Transition.cupertino,
    ),
  ];
}
