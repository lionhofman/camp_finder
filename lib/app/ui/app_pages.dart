import 'package:camp_finder/app/ui/modules/home/home_binding.dart';
import 'package:camp_finder/app/ui/modules/home/home_page.dart';
import 'package:get/get.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
      transition: Transition.cupertino,
    ),
    /* GetPage(
      name: AppRoutes.PRODUCTS,
      page: () => const ProductsPage(),
      binding: ProductsBinding(),
      transition: Transition.cupertino,
    ),*/
  ];
}
