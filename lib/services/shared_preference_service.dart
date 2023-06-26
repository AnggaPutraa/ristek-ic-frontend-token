import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants/preferences_keys.dart';

class SharedPreferencesService {
  static SharedPreferences? _pref;

  static Future<void> init() async {
    _pref = await SharedPreferences.getInstance();
  }

  static Future<SharedPreferences> get instance async {
    _pref ??= await SharedPreferences.getInstance();
    return _pref!;
  }

  static Future<void> saveString(String key, String value) async {
    await _pref!.setString(key, value);
  }

  static String? getString(String key) {
    return _pref!.getString(key);
  }

  static Future<void> removeKey(String key) async {
    await _pref!.remove(key);
  }

  static Future<void> saveToken(String value) async {
    await _pref!.setString(PreferencesKeys.token, value);
  }

  static String? getToken() {
    return _pref!.getString(PreferencesKeys.token);
  }

  static bool containsToken() {
    return _pref!.containsKey(PreferencesKeys.token);
  }

  static Future<void> removeCreds() async {
    await removeKey(PreferencesKeys.token);
    await removeKey(PreferencesKeys.email);
    await removeKey(PreferencesKeys.fullName);
  }

  static Map<String, String> getHeaders() {
    final token = getString(PreferencesKeys.token);
    return <String, String>{
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
    };
  }
}
