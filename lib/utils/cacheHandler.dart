import 'package:shared_preferences/shared_preferences.dart';

class CacheKey {
  static const String TEST_DATA = 'test_data';
}

class CacheHandler {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static Future<void> saveTestData(String data) async {
    print('save test data, $data');
    await setCache(CacheKey.TEST_DATA, data);
  }
  static Future<String> getTestData() async {
    return await getCache(CacheKey.TEST_DATA);
  }

  static Future<void> setCache(String key, dynamic value) async {
    SharedPreferences prefs = await _prefs;
    await prefs.setString(key, value);
  }
  static Future<dynamic> getCache(String key) async {
    SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }
}