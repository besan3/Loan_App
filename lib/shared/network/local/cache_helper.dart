import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{

 static  SharedPreferences? _preferences;
  static Future<SharedPreferences?> init()async{
    _preferences=await SharedPreferences.getInstance() ;
    return _preferences;
  }
  static Future<bool> setString(String key, String value) async =>
      await _preferences!.setString(key, value);
static Future<bool?> saveData({
    required String key,
    required dynamic value
  })async{

    if(value is String) return await _preferences?.setString(key, value);
    if(value is int) return await _preferences?.setInt(key, value);
    if(value is bool) return await _preferences?.setBool(key, value);
    return await _preferences?.setDouble(key, value);
  }
  static Future<bool?> removeData({
    required String key,
  })async{
    return await _preferences?.remove(key, );

  }
}