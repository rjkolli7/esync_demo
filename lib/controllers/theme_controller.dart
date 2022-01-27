import 'package:esync_demo/helper/local_preference_helper.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController implements GetxService {
  ThemeController() {
    _loadCurrentTheme();
  }

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    saveTheme(_darkTheme);
    update();
  }

  void _loadCurrentTheme() async {
    _darkTheme = await isDarkTheme();
    update();
  }
}
