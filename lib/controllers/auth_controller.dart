import 'package:esync_demo/helper/local_preference_helper.dart';
import 'package:esync_demo/helper/logger_utils.dart';
import 'package:get/get.dart';

import '../domain/auth_repository_provider.dart';
import '../domain/model/body/auth_body.dart';
import '../domain/model/response/user_response.dart';

class AuthController extends GetxController with StateMixin<dynamic> {
  /// inject repo abstraction dependency
  final IAuthRepository authRepository;

  AuthController({required this.authRepository});

  Future<UserResponse?> login(AuthBody authBody) async {
    var response = await authRepository.login(authBody).then(
      (value) {
        saveLogin(true);
        saveUserId(value.user?.userId ?? '');
        return Future.value(value);
      },
      onError: (error) {
        Logger.write(error.toString());
        return error;
      },
    );
    Logger.write(response.toString());
    return response;
  }

  Future<dynamic> register(AuthBody authBody) async {
    var response = await authRepository.registration(authBody).then(
      (value) {
        saveLogin(true);
        saveUserId(value.user?.userId ?? '');
        return Future.value(value);
      },
      onError: (error) {
        Logger.write(error.toString());
        return error;
      },
    );
    Logger.write(response.toString());
    return response;
  }

  Future<bool> verifyEmail(String email) async {
    var isExisted = await authRepository.verifyEmail(email).then(
      (value) {
        return Future.value(value);
      },
      onError: (error) {
        Logger.write(error.toString());
        return error;
      },
    );
    return isExisted;
  }

  Future<dynamic> sendEmail(String email) async {
    var response = await authRepository.sendEmail(email).then(
      (value) {
        return Future.value(value);
      },
      onError: (error) {
        Logger.write(error.toString());
        return error;
      },
    );
    return response;
  }

  Future<void> logout() async {
    await authRepository.logout();
  }
}
