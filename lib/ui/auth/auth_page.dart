import 'package:esync_demo/ui/auth/auth_page_type.dart';
import 'package:esync_demo/ui/auth/forgot_password_page.dart';
import 'package:esync_demo/ui/auth/login_page.dart';
import 'package:esync_demo/ui/auth/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/theme_controller.dart';
import '../../helper/image_helper.dart';
import '../../widgets/web_menu_bar.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key})
      : super(
          key: key,
        );

  @override
  State<StatefulWidget> createState() {
    return AuthPageState();
  }
}

class AuthPageState extends State<AuthPage> {
  AuthPageType authPageType = AuthPageType.login;

  Widget getCurrentPage() {
    switch (authPageType) {
      case AuthPageType.register:
        return RegisterPage(onRegisterEvent: onRegisterEvent);
      case AuthPageType.forgotPassword:
        return ForgotPasswordPage(onForgotPasswordEvent: onForgotPasswordEvent);
      case AuthPageType.login:
      default:
        return LoginPage(onLoginEvent: onLoginEvent);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: GetBuilder<ThemeController>(builder: (themeController) {
              return MenuButton(
                icon: themeController.darkTheme
                    ? Icons.dark_mode
                    : Icons.light_mode,
                title: 'Theme',
                onTap: () {
                  themeController.toggleTheme();
                },
              );
            }),
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Images.authLogo,
              const SizedBox(height: 50),
              Container(
                width: GetPlatform.isWeb ? 350 : double.infinity,
                margin: const EdgeInsets.all(20),
                child: getCurrentPage(),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onLoginEvent(AuthPageType _authPageType) {
    setState(() {
      authPageType = _authPageType;
    });
  }

  void onRegisterEvent(AuthPageType _authPageType) {
    setState(() {
      authPageType = _authPageType;
    });
  }

  void onForgotPasswordEvent(AuthPageType _authPageType) {
    setState(() {
      authPageType = _authPageType;
    });
  }
}
