import 'package:shared_preferences/shared_preferences.dart';

  
class SPHelper {
  static const _keyName = 'name';
  static const _keyImage = 'image';
  Future<bool> setSettings(String name, String image) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(_keyName, name);
      await prefs.setString(_keyImage, image);
      return true;
    } on Exception catch (_) {
      return false;
    }
  }

  Future<Map<String, String>> getSettings() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final String name = prefs.getString(_keyName) ?? '';
      final String image = prefs.getString(_keyImage) ?? 'lake';
      return {
        _keyName: name,
        _keyImage: image,
      };
    } on Exception catch (_) {
      return {};
    }
  }
}
