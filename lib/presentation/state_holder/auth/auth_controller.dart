import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  static String? _accessTocken;
  static String? get accessToken => _accessTocken;

  static Future<void> setAccessToken(String token) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.setString('access_token', token);
    _accessTocken = token;
  }

  static Future<void> getAccessToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    _accessTocken = sharedPreferences.getString('access_token');
  }

  static Future<void> clear() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  static bool get isLoggedIn {
    return _accessTocken != null;
  }
}
