import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {

  static late SharedPreferences _sharedPrefs;

  factory SharedPrefs() => SharedPrefs._internal();

  SharedPrefs._internal();


  Future<void> init() async {
    _sharedPrefs = await SharedPreferences.getInstance();
  }


  setTheme(String? value) {
    _sharedPrefs?.setString(selectedTheme, value!);
  }

  static const String selectedTheme = "theme";

  static Future<bool> setString(String key, String value) async =>
      await _sharedPrefs.setString(key, value);


   static String? getString(String key){
  return _sharedPrefs.getString(key);
}


  String get theme=>_sharedPrefs?.getString('theme')??'system';


}