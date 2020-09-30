
import 'package:chat_app_flutter/core/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../functions.dart';

class StorageManager {
  static Future<SharedPreferences> get _instance async => _prefs ??= await SharedPreferences.getInstance();
  static SharedPreferences _prefs;

  // call this method from iniState() function of mainApp().
  static Future<SharedPreferences> initPrefs() async {
    _prefs = await _instance;
    return _prefs;
  }

  static String getString(String key, [String defValue]) {
    return _prefs.getString(key) ?? defValue ?? "blue";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;
    return prefs?.setString(key, value) ?? Future.value(false);
  }

  static bool getBool(String key, [String defValue]) {
    return _prefs.getBool(key) ?? defValue ?? false;
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs?.setBool(key, value) ?? Future.value(false);
  }

  static Future<bool> setToken(String value) async {
    var prefs = await _instance;
    return prefs?.setString(TOKEN_KEY, value) ?? Future.value(false);
  }

  static String getToken() {
    String token = _prefs.getString(TOKEN_KEY);
    print('[GET_TOKEN] isNull = ${token == null} -> on Route [${Get.currentRoute}]');
    return token;
  }

  static Map<String, dynamic> getParsedToken() {
    return parseJwt(_prefs.getString(TOKEN_KEY));
  }

  static void removeKey(String key) {
    print('[REMOVED]: $key -> on Route [${Get.currentRoute}]');
    _prefs.remove(key);
  }

  static void clearUserData() {
    print('[CLEAR_USERDATA] -> on Route [${Get.currentRoute}]');
    _prefs.remove(TOKEN_KEY);
  }

  static void clearAll() {
    print('[CLEAR_ALL] -> on Route [${Get.currentRoute}]');
    _prefs.clear();
  }
}
