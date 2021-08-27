import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_app/common/database_strings.dart';

class Prefs {
  static Future<int?> getLoggedInUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt(identifier);
  }

  static Future<bool> setLoggedInUser(int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setInt(identifier, value);
  }
}
