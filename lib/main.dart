import 'package:esync_demo/bindings/theme_bindings.dart';
import 'package:esync_demo/helper/local_preference_helper.dart';
import 'package:esync_demo/routes/app_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/theme_controller.dart';
import 'firebase_base/firebase_options.dart';
import 'helper/logger_utils.dart';
import 'helper/theme.dart';
import 'routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  ThemeBindings().dependencies();
  bool _isLogin = await isLogin();
  runApp(MyApp(
    isLogin: _isLogin,
  ));
}

class MyApp extends StatelessWidget {
  final bool isLogin;
  const MyApp({Key? key, required this.isLogin}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(builder: (themeController) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        enableLog: true,
        logWriterCallback: Logger.write,
        title: 'Esync Demo',
        theme: themeController.darkTheme ? dark : light,
        initialRoute: isLogin ? Routes.home : Routes.auth,
        getPages: AppPages.routes,
      );
    });
  }
}
