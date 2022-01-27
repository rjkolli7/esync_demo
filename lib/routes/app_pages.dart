import 'package:esync_demo/bindings/auth_bindings.dart';
import 'package:esync_demo/bindings/category_bindings.dart';
import 'package:esync_demo/bindings/home_bindings.dart';
import 'package:esync_demo/bindings/product_bindings.dart';
import 'package:esync_demo/ui/auth/auth_page.dart';
import 'package:esync_demo/ui/product/add_category_page.dart';
import 'package:esync_demo/ui/product/add_product_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../ui/home/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.auth,
      binding: AuthBindings(),
      page: () => const AuthPage(),
    ),
    GetPage(
      name: Routes.home,
      binding: HomeBindings(),
      page: () => const HomePage(),
    ),
    GetPage(
      name: Routes.addProduct,
      binding: ProductBindings(),
      page: () => const AddProductPage(),
    ),
    GetPage(
      name: Routes.addCategory,
      binding: CategoryBindings(),
      page: () => const AddCategoryPage(),
    ),
  ];
}
