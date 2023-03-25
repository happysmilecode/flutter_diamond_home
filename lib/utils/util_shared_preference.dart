import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtils {
  static SharedPreferenceUtils? storageUtil;
  static SharedPreferences? preferences;

  static Future<SharedPreferenceUtils?> getInstance() async {
    if (storageUtil == null) {
      // keep local instance till it is fully initialized.
      var secureStorage = SharedPreferenceUtils._();
      await secureStorage.init();
      storageUtil = secureStorage;
    }
    return storageUtil;
  }

  SharedPreferenceUtils._();

  Future init() async {
    preferences = await SharedPreferences.getInstance();
  }

  // put string
  static Future<bool>? putString(String key, String value) {
    if (preferences == null) return null;
    return preferences?.setString(key, value);
  }

  // get string
  static String getString(String key, {String defValue = ''}) {
    if (preferences == null) return defValue;
    return preferences?.getString(key) ?? defValue;
  }

  // put Integer
  static Future<bool>? putInteger(String key, int value) {
    if (preferences == null) return null;
    return preferences?.setInt(key, value);
  }

  // get Integer
  static int getInteger(String key, {int defValue = 0}) {
    if (preferences == null) return defValue;
    return preferences?.getInt(key) ?? defValue;
  }

  // put Double
  static Future<bool>? putDouble(String key, double value) {
    if (preferences == null) return null;
    return preferences?.setDouble(key, value);
  }

  // get Double
  static double getDouble(String key, {double defValue = 0.0}) {
    if (preferences == null) return defValue;
    return preferences?.getDouble(key) ?? defValue;
  }

  // put Boolean
  static Future<bool>? putBoolean(String key, bool value) {
    if (preferences == null) return null;
    return preferences?.setBool(key, value);
  }

  // get Boolean
  static bool getBoolean(String key, {bool defValue = false}) {
    if (preferences == null) return defValue;
    return preferences?.getBool(key) ?? defValue;
  }

  //remove value
  static void removeValueFromStorage(String key) {
    bool? isValue = preferences?.containsKey(key);
    if (isValue == true) preferences?.remove(key);
  }

  //clear preferences
  static void clearStorage() {
    if (preferences != null) preferences?.clear();
  }
}
