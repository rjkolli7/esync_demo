import 'package:esync_demo/controllers/auth_controller.dart';
import 'package:get/get.dart';

import '../data/auth_repository.dart';
import '../domain/auth_repository_provider.dart';

class AuthBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAuthRepository>(() =>
        AuthRepository()); // Lazy instance "IHomeProvider" created [false]
    Get.lazyPut(() => AuthController(
        authRepository:
            Get.find())); // Lazy instance "HomeController" created [false]
  }
}
