import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String token = "token";

  static late SharedPreferences _sharedPreferences;

  // Initialize the shared preferences instance
  static Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  // Cache data based on its type
  static Future<void> cacheData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) {
      await _sharedPreferences.setString(key, value);
    } else if (value is bool) {
      await _sharedPreferences.setBool(key, value);
    } else if (value is int) {
      await _sharedPreferences.setInt(key, value);
    } else if (value is double) {
      await _sharedPreferences.setDouble(key, value);
    } else if (value is List<String>) {
      await _sharedPreferences.setStringList(key, value);
    } else {
      throw Exception('Unsupported type');
    }
  }

  // Retrieve data based on key
  static dynamic getData({required String key}) {
    return _sharedPreferences.get(key);
  }
}
