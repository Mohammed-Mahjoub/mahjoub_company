import 'package:mahjoub_company/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { loggedIn, id, name, mobile, gender, token, cityId, storeId , language }

class SharedPrefController {
  SharedPrefController._();

  late SharedPreferences _sharedPreferences;
  static SharedPrefController? _instance;

  factory SharedPrefController() {
    return _instance ??= SharedPrefController._();
  }

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  void changeLanguage({required String langCode}) {
    _sharedPreferences.setString(PrefKeys.language.name, langCode);
  }


  Future<void> save(User user) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.name, true);
    await _sharedPreferences.setInt(PrefKeys.id.name, user.id);
    await _sharedPreferences.setString(PrefKeys.name.name, user.name);
    await _sharedPreferences.setString(PrefKeys.mobile.name, user.mobile);
    await _sharedPreferences.setString(PrefKeys.gender.name, user.gender);
    await _sharedPreferences.setString(PrefKeys.cityId.name, user.cityId);
    await _sharedPreferences.setString(PrefKeys.storeId.name, user.storeId);
    await _sharedPreferences.setString(
        PrefKeys.token.name, 'Bearer ${user.token}');
  }

  T? getValueFor<T>({required String key}) {
    if (_sharedPreferences.containsKey(key)) {
      return _sharedPreferences.get(key) as T?;
    }
    return null;
  }

  void clear() async{
    _sharedPreferences.clear();
  }
}
