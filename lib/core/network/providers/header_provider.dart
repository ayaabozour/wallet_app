import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wallet_app_project/core/network/token_types.dart';
import 'package:wallet_app_project/core/services/shared_prefs.dart';


final headerProvider = Provider<HeaderBuilder>((ref) {
  return HeaderBuilder(SharedPrefs.instance);
});

class HeaderBuilder {
  final SharedPrefs _prefs;

  HeaderBuilder(this._prefs);

  Map<String, String> build(TokenType token) {
    switch (token) {
      case TokenType.contentType:
        return {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ${_prefs.getToken()}',
          // 'Accept-Language': _prefs.getLanguage(),
        };

      case TokenType.authorization:
        return {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${_prefs.getToken()}',
          // 'Accept-Language': _prefs.getLanguage(),
        };

      case TokenType.multipart:
        return {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${_prefs.getToken()}',
          'Content-Type': 'multipart/form-data',
          // 'Accept-Language': _prefs.getLanguage(),
        };

      case TokenType.urlencoded:
        return {
          'Accept': 'application/json',
          'Authorization': 'Bearer ${_prefs.getToken()}',
          'Content-Type': 'application/x-www-form-urlencoded',
          // 'Accept-Language': _prefs.getLanguage(),
        };

      case TokenType.acceptAll:
        return {
          'Accept': '*/*',
          'Authorization': 'Bearer ${_prefs.getToken()}',
          'Content-Type': 'application/json',
          // 'Accept-Language': _prefs.getLanguage(),
        };

      default:
        return {
          'Accept': 'application/json',
          // 'Accept-Language': _prefs.getLanguage(),
        };
    }
  }
}
