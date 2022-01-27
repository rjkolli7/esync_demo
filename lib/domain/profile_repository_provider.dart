import 'package:esync_demo/domain/model/response/user_data.dart';
import 'package:esync_demo/domain/model/response/user_response.dart';

abstract class IProfileRepository {
  Future<UserResponse> getProfileData(String uid);
  Future<String> updateProfileData(UserData data);
}
