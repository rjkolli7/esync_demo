import 'package:esync_demo/controllers/auth_controller.dart';
import 'package:esync_demo/domain/model/body/auth_body.dart';
import 'package:esync_demo/domain/model/response/user_response.dart';
import 'package:esync_demo/helper/dialog_helper.dart';
import 'package:esync_demo/helper/logger_utils.dart';
import 'package:esync_demo/helper/test_styles.dart';
import 'package:esync_demo/ui/auth/auth_page_type.dart';
import 'package:esync_demo/widgets/dob_textfield.dart';
import 'package:esync_demo/widgets/first_name_textfield.dart';
import 'package:esync_demo/widgets/gender_textfield.dart';
import 'package:esync_demo/widgets/last_name_textfield.dart';
import 'package:esync_demo/widgets/phone_textfield.dart';
import 'package:esync_demo/widgets/span_button.dart';
import 'package:esync_demo/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../widgets/email_textfield.dart';
import '../../widgets/password_textfield.dart';

class RegisterPage extends GetView<AuthController> {
  final Function(AuthPageType) onRegisterEvent;

  RegisterPage({Key? key, required this.onRegisterEvent}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<EmailTextFormFieldState>();
  final _pwdKey = GlobalKey<PasswordTextFieldState>();
  final _firstNameKey = GlobalKey<FirstNameFormFieldState>();
  final _lastNameKey = GlobalKey<LastNameFormFieldState>();
  final _phoneKey = GlobalKey<PhoneTextFormFieldState>();
  final _genderKey = GlobalKey<GenderFormFieldState>();
  final _dateKey = GlobalKey<DobFormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Sign up',
          style: TextStyles.titleTextStyle,
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FirstNameFormField(key: _firstNameKey),
                LastNameFormField(key: _lastNameKey),
                EmailTextFormField(key: _emailKey),
                PhoneTextFormField(key: _phoneKey),
                PasswordTextField(key: _pwdKey),
                GenderFormField(key: _genderKey),
                DobFormField(key: _dateKey),
                const SizedBox(height: 30),
                StyledMaterialButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      doRegister(context);
                    }
                  },
                  title: 'SIGN UP',
                ),
                const SizedBox(height: 50),
                SpanButton(
                  span1Text: 'Already have an account? ',
                  clickableSpan: 'SignIn',
                  onPressed: () {
                    onRegisterEvent(AuthPageType.login);
                  },
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void doRegister(BuildContext context) async {
    var result = await controller.register(
      AuthBody(
        email: _emailKey.currentState?.emailController.text,
        password: _pwdKey.currentState?.passwordController.text,
        firstName: _firstNameKey.currentState?.firstNameController.text,
        lastName: _lastNameKey.currentState?.lastNameController.text,
        mobile: _phoneKey.currentState?.phoneController.text,
        gender: _genderKey.currentState?.genderController.text,
        dob: _dateKey.currentState?.dobController.text,
      ),
    );
    Logger.write(result.toString());
    if (result is UserResponse) {
      Get.offAllNamed(Routes.home);
    } else {
      showErrorDialog(context, 'Signup Error', result);
    }
  }
}
