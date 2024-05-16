import 'package:shared_preferences/shared_preferences.dart';

class MySharePreferance {
  static SharedPreferences? sharedPreferences;

  static void init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setToken(String token) async {
    sharedPreferences!.setString('token', token);
  }

  static String? getToken() => sharedPreferences!.getString('token');
}
