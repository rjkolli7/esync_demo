import 'package:esync_demo/controllers/category_controller.dart';
import 'package:esync_demo/data/category_repository.dart';
import 'package:esync_demo/domain/category_repository_provider.dart';
import 'package:get/get.dart';

class CategoryBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICategoryRepository>(() => CategoryRepository());
    Get.lazyPut(() => CategoryController(categoryRepository: Get.find()));
  }
}
