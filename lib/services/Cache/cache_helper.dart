import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future setBool(String key, bool value) async {
    return await sharedPreferences?.setBool(key, value);
  }

  static Future setString(String key, String value) async {
    return await sharedPreferences?.setString(key, value);
  }

  static Future removeString(String key) async {
    return await sharedPreferences?.remove(key);
  }

  static get(String key) {
    return sharedPreferences?.get(key);
  }

  /// Cached auth header value, e.g. `Bearer <jwt>`, or null when logged out.
  static String? get token {
    final value = get('token');
    return value is String && value.isNotEmpty ? value : null;
  }

  static bool get hasToken => token != null;
}
