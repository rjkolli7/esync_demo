import 'package:esync_demo/controllers/auth_controller.dart';
import 'package:esync_demo/domain/model/body/auth_body.dart';
import 'package:esync_demo/domain/model/response/user_response.dart';
import 'package:esync_demo/helper/dialog_helper.dart';
import 'package:esync_demo/helper/logger_utils.dart';
import 'package:esync_demo/helper/test_styles.dart';
import 'package:esync_demo/ui/auth/auth_page_type.dart';
import 'package:esync_demo/widgets/email_textfield.dart';
import 'package:esync_demo/widgets/password_textfield.dart';
import 'package:esync_demo/widgets/span_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_routes.dart';
import '../../widgets/styled_button.dart';

class LoginPage extends GetView<AuthController> {
  final Function(AuthPageType) onLoginEvent;

  LoginPage({Key? key, required this.onLoginEvent}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<EmailTextFormFieldState>();
  final _pwdKey = GlobalKey<PasswordTextFieldState>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Sign In',
          style: TextStyles.titleTextStyle,
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: EmailTextFormField(
                    key: _emailKey,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: PasswordTextField(
                    key: _pwdKey,
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () async {
                      onLoginEvent(AuthPageType.forgotPassword);
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ),
                const SizedBox(height: 50),
                StyledMaterialButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var result = await controller.login(
                        AuthBody(
                          email: _emailKey.currentState?.emailController.text,
                          password:
                              _pwdKey.currentState?.passwordController.text,
                        ),
                      );
                      Logger.write(result.toString());
                      if (result is UserResponse) {
                        if (result.user != null) {
                          Get.offAllNamed(Routes.home);
                        } else {
                          showErrorDialog(context, 'Sign in Error',
                              Exception(result.error));
                        }
                      } else {}
                    }
                  },
                  title: 'SIGN IN',
                ),
                const SizedBox(height: 50),
                SpanButton(
                  span1Text: 'Don\'t have an account? ',
                  clickableSpan: 'Signup',
                  onPressed: () {
                    onLoginEvent(AuthPageType.register);
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
}
