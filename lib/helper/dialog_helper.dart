import 'package:esync_demo/bindings/auth_bindings.dart';
import 'package:esync_demo/controllers/auth_controller.dart';
import 'package:esync_demo/helper/string_helper.dart';
import 'package:esync_demo/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorDialog(BuildContext context, String title, Exception e) {
  showDialog<void>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          title,
          style: const TextStyle(fontSize: 24),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                '${(e as dynamic).message}',
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.deepPurple),
            ),
          ),
        ],
      );
    },
  );
}

void showLogoutDialog() {
  /*AlertDialog(
    title: const Text(
      'Logout',
      style: TextStyle(fontSize: 24),
    ),
    content: SingleChildScrollView(
      child: ListBody(
        children: const <Widget>[
          Text(
            StringHelper.logoutMessage,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(Get.context!).pop();
        },
        child: const Text(
          StringHelper.no,
        ),
      ),
      GetBuilder<AuthController>(builder: (authController) {
        return TextButton(
          onPressed: () async {
            await authController.logout();
            Get.offAll(Routes.auth);
          },
          child: const Text(
            StringHelper.yes,
          ),
        );
      }),
    ],
  ),*/
  AuthBindings().dependencies();
  var authController = Get.find<AuthController>();
  Get.defaultDialog(
    title: StringHelper.logout,
    content: const Text(
      StringHelper.logoutMessage,
    ),
    textCancel: StringHelper.cancel,
    textConfirm: StringHelper.yes,
    onCancel: () {
      Get.back();
    },
    onConfirm: () async {
      await authController.logout();
      Get.offAllNamed(Routes.auth);
    },
  );
}
