import 'package:shared_preferences/shared_preferences.dart';

const String keyTheme = "theme";
const String keyIsLogin = "isLogin";
const String keyUserId = "userId";

SharedPreferences? _sharedPreferences;

_initPrefs() async {
  _sharedPreferences ??= await SharedPreferences.getInstance();
}

Future<bool> isDarkTheme() async {
  await _initPrefs();
  var _isDarkTheme = _sharedPreferences?.getBool(keyTheme) ?? false;
  return _isDarkTheme;
}

saveTheme(bool value) async {
  await _initPrefs();
  _sharedPreferences?.setBool(keyTheme, value);
}

Future<bool> isLogin() async {
  await _initPrefs();
  var _isLogin = _sharedPreferences?.getBool(keyIsLogin) ?? false;
  return _isLogin;
}

saveLogin(bool value) async {
  await _initPrefs();
  await _sharedPreferences?.setBool(keyIsLogin, value);
}

Future<String> userId() async {
  await _initPrefs();
  var _userId = _sharedPreferences?.getString(keyUserId) ?? '';
  return _userId;
}

saveUserId(String value) async {
  await _initPrefs();
  await _sharedPreferences?.setString(keyUserId, value);
}

clearData() async {
  await _initPrefs();
  await _sharedPreferences?.clear();
}
