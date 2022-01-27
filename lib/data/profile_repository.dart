import 'package:esync_demo/domain/model/response/user_data.dart';
import 'package:esync_demo/domain/model/response/user_response.dart';
import 'package:esync_demo/domain/profile_repository_provider.dart';
import 'package:esync_demo/helper/logger_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class ProfileRepository extends IProfileRepository {
  @override
  Future<UserResponse> getProfileData(String uid) async {
    try {
      final databaseRef = FirebaseDatabase.instance.ref('users');
      final userRef = databaseRef.child(uid);
      DataSnapshot data = await userRef.get();
      Logger.write(data.value.toString());
      return Future.value(UserResponse(user: UserData.fromMap(data.value)));
    } on FirebaseAuthException catch (error) {
      Logger.write(error.toString());
      return Future.error(
          UserResponse(error: error.message ?? 'unable to get profile'));
    } on Exception catch (error) {
      Logger.write(error.toString());
      return Future.error(
          UserResponse(error: error.toString() ?? 'unable to get profile'));
    }
  }

  @override
  Future<String> updateProfileData(UserData data) async {
    try {
      final databaseRef = FirebaseDatabase.instance.ref('users');
      final userRef = databaseRef.child(data.userId!);
      await userRef.update(<String, dynamic>{
        "fName": data.firstName,
        "lName": data.lastName,
        "email": data.email,
        "mobile": data.mobile,
        "gender": data.gender,
        "dob": data.dob,
        "uid": data.userId,
      });
      Logger.write('updated');
      return Future.value('success');
    } on FirebaseAuthException catch (error) {
      Logger.write(error.message ?? 'unable to register');
      return Future.error(error.message ?? 'unable to register');
    } on Exception catch (error) {
      Logger.write(error.toString());
      return Future.error(error.toString());
    }
  }
}
