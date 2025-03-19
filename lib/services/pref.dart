import 'package:shared_preferences/shared_preferences.dart';

class Pref {
  static SharedPreferences? prefs;
  static String token = "token";
  static String brightness = 'brightness';
  static final String isBioEnable = 'isBioEnable';
  static final String username = 'username';
  static final String password = 'password';
  static final String auth = 'auth';
  static final String platform = 'platform';

  static getPref() async {
    prefs = await SharedPreferences.getInstance();
  }

  static bool getPrefBoolean(String key, {defaultValue = false}) {
    bool result = false;
    result = prefs!.getBool(key)!;
    if (result == null) {
      result = defaultValue;
    }
    return result;
  }

  static String getPrefString(String key, {String defaultValue = Str.NA}) {
    String? value = prefs!.getString(key);
    if (value == null) {
      value = defaultValue;
    }
    return value;
  }

  static int getPrefInt(String key, {int defaultValue = 0}) {
    int? value = prefs?.getInt(key);
    if (value == null) {
      value = defaultValue;
    }
    return value;
  }

  static double getPrefDouble(String key, {double defaultValue = 0.0}) {
    double? value = prefs?.getDouble(key);
    if (value == null) {
      value = defaultValue;
    }
    return value;
  }

  static setPrefString(String prefsKey, String value) {
    if (value == null) value = '';

    prefs?.setString(prefsKey, value);
  }

  static setPrefDouble(String prefsKey, double value) {
    if (value == null) value = 0.0;

    prefs?.setDouble(prefsKey, value);
  }

  static setPrefInt(String prefsKey, int value) {
    if (value == null) value = 0;

    prefs?.setInt(prefsKey, value);
  }

  static setPrefBoolean(String key, bool value) {
    // if (value == null) value = false;
    prefs?.setBool(key, value);
  }

//Todo: Functions
}

class Str {
  static const String NA = 'N/A';
}
