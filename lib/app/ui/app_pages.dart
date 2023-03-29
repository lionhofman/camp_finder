import 'package:camp_finder/app/ui/global_widgets/bottom_navigation/root_binding.dart';
import 'package:camp_finder/app/ui/global_widgets/bottom_navigation/root_page.dart';
import 'package:camp_finder/app/ui/modules/home/home_binding.dart';
import 'package:camp_finder/app/ui/modules/home/home_page.dart';
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
      page: () => const RootPage(),
      binding: RootBinding(),
    ),
    /* GetPage(
      name: AppRoutes.PRODUCTS,
      page: () => const ProductsPage(),
      binding: ProductsBinding(),
      transition: Transition.cupertino,
    ),*/
  ];
}
