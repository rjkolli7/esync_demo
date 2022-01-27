import 'package:esync_demo/domain/model/response/user_data.dart';
import 'package:esync_demo/domain/model/response/user_response.dart';
import 'package:esync_demo/domain/profile_repository_provider.dart';
import 'package:esync_demo/helper/local_preference_helper.dart';
import 'package:esync_demo/helper/logger_utils.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with StateMixin<dynamic> {
  /// inject repo abstraction dependency
  final IProfileRepository profileRepository;

  ProfileController({required this.profileRepository});

  UserData? _userData;
  get userData => _userData;

  Future<UserResponse> getProfile() async {
    var uid = await userId();
    var response = await profileRepository.getProfileData(uid).then((value) {
      Logger.write(value.toString());
      _userData = value.user;
      update();
      return Future.value(value);
    }, onError: (error) {
      Logger.write(error.toString());
      return error;
    });
    return response;
  }

  Future<String> updateProfile(UserData data) async {
    var response =
        await profileRepository.updateProfileData(data).then((value) {
      Logger.write(value.toString());
      update();
      return Future.value(value);
    }, onError: (error) {
      Logger.write(error.toString());
      return error;
    });
    return response;
  }
}
