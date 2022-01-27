import 'package:esync_demo/controllers/category_controller.dart';
import 'package:esync_demo/controllers/product_controller.dart';
import 'package:esync_demo/controllers/profile_controller.dart';
import 'package:esync_demo/data/category_repository.dart';
import 'package:esync_demo/data/product_repository.dart';
import 'package:esync_demo/data/profile_repository.dart';
import 'package:esync_demo/domain/category_repository_provider.dart';
import 'package:esync_demo/domain/product_repository_provider.dart';
import 'package:esync_demo/domain/profile_repository_provider.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IProfileRepository>(() => ProfileRepository());
    Get.lazyPut(() => ProfileController(profileRepository: Get.find()));

    Get.lazyPut<IProductRepository>(() => ProductRepository());
    Get.lazyPut(() => ProductController(productRepository: Get.find()));

    Get.lazyPut<ICategoryRepository>(() => CategoryRepository());
    Get.lazyPut(() => CategoryController(categoryRepository: Get.find()));
  }
}
