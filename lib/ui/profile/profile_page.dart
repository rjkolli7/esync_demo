import 'package:esync_demo/controllers/profile_controller.dart';
import 'package:esync_demo/domain/model/response/user_data.dart';
import 'package:esync_demo/helper/dialog_helper.dart';
import 'package:esync_demo/helper/local_preference_helper.dart';
import 'package:esync_demo/helper/logger_utils.dart';
import 'package:esync_demo/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/dob_textfield.dart';
import '../../widgets/email_textfield.dart';
import '../../widgets/first_name_textfield.dart';
import '../../widgets/gender_textfield.dart';
import '../../widgets/last_name_textfield.dart';
import '../../widgets/phone_textfield.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _formKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<EmailTextFormFieldState>();
  final _firstNameKey = GlobalKey<FirstNameFormFieldState>();
  final _lastNameKey = GlobalKey<LastNameFormFieldState>();
  final _phoneKey = GlobalKey<PhoneTextFormFieldState>();
  final _genderKey = GlobalKey<GenderFormFieldState>();
  final _dateKey = GlobalKey<DobFormFieldState>();
  var currentUserId = '';

  @override
  void initState() {
    super.initState();
    userId().then((value) {
      currentUserId = value;
    });
    Get.find<ProfileController>().getProfile().then((value) {
      setState(() {
        _emailKey.currentState!.emailController.text = value.user?.email ?? '';
        _firstNameKey.currentState!.firstNameController.text =
            value.user?.firstName ?? '';
        _lastNameKey.currentState!.lastNameController.text =
            value.user?.lastName ?? '';
        _phoneKey.currentState!.phoneController.text = value.user?.mobile ?? '';
        _genderKey.currentState!.genderController.text =
            value.user?.gender ?? '';
        _dateKey.currentState!.dobController.text = value.user?.dob ?? '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (profile) {
      Logger.write(profile.toString());
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FirstNameFormField(key: _firstNameKey),
                    LastNameFormField(key: _lastNameKey),
                    EmailTextFormField(
                      key: _emailKey,
                      enabled: false,
                    ),
                    PhoneTextFormField(key: _phoneKey),
                    GenderFormField(key: _genderKey),
                    DobFormField(key: _dateKey),
                    const SizedBox(height: 30),
                    StyledMaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          updateProfile(profile);
                        }
                      },
                      title: 'Update Profile',
                    ),
                    const SizedBox(height: 30),
                    Visibility(
                      visible: GetPlatform.isMobile,
                      child: StyledMaterialButton(
                        onPressed: () {
                          showLogoutDialog();
                        },
                        title: 'Logout',
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  void updateProfile(ProfileController controller) async {
    var result = await controller.updateProfile(
      UserData(
        email: _emailKey.currentState?.emailController.text,
        firstName: _firstNameKey.currentState?.firstNameController.text,
        lastName: _lastNameKey.currentState?.lastNameController.text,
        mobile: _phoneKey.currentState?.phoneController.text,
        gender: _genderKey.currentState?.genderController.text,
        dob: _dateKey.currentState?.dobController.text,
        userId: currentUserId,
      ),
    );
    if (result == 'success') {
      showErrorDialog(
          context, 'Success', Exception('Profile Updated Successfully'));
    } else {
      showErrorDialog(context, 'Success', Exception(result));
    }
  }
}
