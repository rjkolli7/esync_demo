import 'package:esync_demo/domain/auth_repository_provider.dart';
import 'package:esync_demo/domain/model/body/auth_body.dart';
import 'package:esync_demo/domain/model/response/user_data.dart';
import 'package:esync_demo/helper/local_preference_helper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../domain/model/response/user_response.dart';

class AuthRepository extends IAuthRepository {
  @override
  Future<UserResponse> login(AuthBody authBody) async {
    try {
      UserCredential userCredentials =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: authBody.email ?? '',
        password: authBody.password ?? '',
      );
      User? user = userCredentials.user;
      return Future.value(
        UserResponse(
          user: UserData(
            email: user?.email,
            userId: user?.uid,
          ),
        ),
      );
    } on FirebaseAuthException catch (error) {
      return Future.error(
          UserResponse(error: error.message ?? 'unable to login'));
    }
  }

  @override
  Future<UserResponse> registration(AuthBody authBody) async {
    try {
      UserCredential userCredentials =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: authBody.email ?? '',
        password: authBody.password ?? '',
      );
      User? user = userCredentials.user;
      final databaseRef = FirebaseDatabase.instance.ref();
      databaseRef.child('users').child(user!.uid).set(<String, dynamic>{
        "fName": authBody.firstName,
        "lName": authBody.lastName,
        "email": authBody.email,
        "mobile": authBody.mobile,
        "gender": authBody.gender,
        "dob": authBody.dob,
        "uid": user.uid,
      });
      return Future.value(
        UserResponse(
          user: UserData(
            email: user.email,
            userId: user.uid,
          ),
        ),
      );
    } on FirebaseAuthException catch (error) {
      return Future.error(
          UserResponse(error: error.message ?? 'unable to register'));
    }
  }

  @override
  Future<bool> verifyEmail(String email) async {
    try {
      var methods =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (methods.contains('password')) {
        return Future.value(true);
      } else {
        return Future.error(false);
      }
    } on FirebaseAuthException catch (error) {
      return Future.error(false);
    }
  }

  @override
  Future<dynamic> sendEmail(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return Future.value(true);
    } on FirebaseAuthException catch (error) {
      return Future.error(error.message ?? 'unable send email');
    }
  }

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
    await clearData();
  }
}
