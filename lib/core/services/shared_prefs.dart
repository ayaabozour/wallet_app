import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPrefs._();
  static SharedPrefs instance = SharedPrefs._();
  static SharedPreferences? _prefs;

  final String _isFirstOpen = "isFirstOpen";
  final String _tokenKey = "token";
  final String _isDarkMode = "isDarkMode";
  final String _isLogin = "isLoginKey";

  Future<void> initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  void setIsFirstOpen({required bool isFirstOpen}) {
    _prefs!.setBool(_isFirstOpen, isFirstOpen);
  }

  bool getIsFirstOpen() {
    return _prefs!.getBool(_isFirstOpen) ?? true;
  }

  void setToken({required String token}) {
    _prefs!.setString(_tokenKey, token);
  }

  String getToken() {
    return _prefs!.getString(_tokenKey) ?? "";
  }

  void setIsLogin({required bool isLogin}) {
    _prefs!.setBool(_isLogin, isLogin);
  }

  bool getIsLogin() {
    return _prefs!.getBool(_isLogin) ?? false;
  }

  void setDarkMode({required bool isDarkMode}) {
    _prefs!.setBool(_isDarkMode, isDarkMode);
  }

  bool getDarkMode() {
    return _prefs!.getBool(_isDarkMode) ?? false;
  }

  void clearToken() {
    _prefs!.remove(_tokenKey);
  }
}
