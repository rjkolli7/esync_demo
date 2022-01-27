import 'package:esync_demo/domain/model/response/user_data.dart';

class UserResponse {
  String error;
  UserData? user;

  UserResponse({this.error = 'Invalid Error', this.user});
}
