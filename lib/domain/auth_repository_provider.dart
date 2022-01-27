import 'model/body/auth_body.dart';
import 'model/response/user_response.dart';

abstract class IAuthRepository {
  Future<UserResponse> registration(AuthBody authBody);
  Future<UserResponse> login(AuthBody authBody);
  Future<bool> verifyEmail(String email);
  Future<dynamic> sendEmail(String email);
  Future<void> logout();
}
