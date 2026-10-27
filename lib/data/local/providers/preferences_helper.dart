import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {
  static const String _keyDefaultCallerName = 'default_caller_name';
  static const String _defaultFallbackName = 'Unknown Caller';

  static Future<void> setDefaultCallerName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyDefaultCallerName, name);
  }

  static Future<String> getDefaultCallerName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyDefaultCallerName) ?? _defaultFallbackName;
  }
}
