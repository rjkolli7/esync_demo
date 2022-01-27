import 'package:esync_demo/controllers/theme_controller.dart';
import 'package:get/get.dart';

class ThemeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() =>
        ThemeController()); // Lazy instance "ThemeController" created [false]
  }
}
