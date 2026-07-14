import 'package:shared_preferences/shared_preferences.dart';

class AppLocalStorage {
  AppLocalStorage._();

  /// Save a generic value. Return true if succes
  static Future<bool> saveValue<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();

    if (value is int) {
      return await prefs.setInt(key, value);
    } else if (value is String) {
      return await prefs.setString(key, value);
    } else if (value is bool) {
      return await prefs.setBool(key, value);
    } else if (value is double) {
      return await prefs.setDouble(key, value);
    } else if (value is List<String>) {
      return await prefs.setStringList(key, value);
    } else {
      throw Exception('Tipo de dato no soportado por SharedPreferences');
    }
  }

  /// Get a value
  static Future<T?> getValue<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();

    // Casting fron Object? to T?
    return prefs.get(key) as T?;
  }
}
