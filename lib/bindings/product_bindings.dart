import 'package:esync_demo/controllers/category_controller.dart';
import 'package:esync_demo/controllers/product_controller.dart';
import 'package:esync_demo/data/category_repository.dart';
import 'package:esync_demo/data/product_repository.dart';
import 'package:esync_demo/domain/category_repository_provider.dart';
import 'package:esync_demo/domain/product_repository_provider.dart';
import 'package:get/get.dart';

class ProductBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IProductRepository>(() => ProductRepository());
    Get.lazyPut(() => ProductController(productRepository: Get.find()));

    Get.lazyPut<ICategoryRepository>(() => CategoryRepository());
    Get.lazyPut(() => CategoryController(categoryRepository: Get.find()));
  }
}
