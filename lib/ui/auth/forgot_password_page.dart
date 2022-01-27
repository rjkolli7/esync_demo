import 'package:esync_demo/controllers/auth_controller.dart';
import 'package:esync_demo/helper/dialog_helper.dart';
import 'package:esync_demo/helper/test_styles.dart';
import 'package:esync_demo/ui/auth/auth_page_type.dart';
import 'package:esync_demo/widgets/styled_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends GetView<AuthController> {
  final Function(AuthPageType) onForgotPasswordEvent;

  ForgotPasswordPage({Key? key, required this.onForgotPasswordEvent})
      : super(key: key);

  final _formKey = GlobalKey<FormState>(debugLabel: '_PasswordFormState');
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Forgot Password',
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
                  child: TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      hintText: 'Enter your email',
                    ),
                    validator: (value) {
                      RegExp pattern = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                      if (value!.isEmpty) {
                        return 'Enter your email address to continue';
                      }
                      if (!pattern.hasMatch(value)) {
                        return 'Enter valid email address to continue';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 50),
                StyledMaterialButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var result =
                          await controller.verifyEmail(_emailController.text);
                      if (result) {
                        var sentEmail =
                            await controller.sendEmail(_emailController.text);
                        if (sentEmail) {
                          showErrorDialog(
                              context,
                              'Success',
                              Exception(
                                  'Successfully sent an email. Please rest your password from there'));
                        } else {
                          showErrorDialog(
                              context,
                              'Error',
                              Exception(
                                  'Unable to send email. May be invalid email or email not registered with us.'));
                        }
                      } else {
                        showErrorDialog(context, 'Not found',
                            Exception('This email is not registered with us.'));
                      }
                    }
                  },
                  title: 'SEND EMAIL',
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    onForgotPasswordEvent(AuthPageType.login);
                  },
                  child: const Text('GO BACK'),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
