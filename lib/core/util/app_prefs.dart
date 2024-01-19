import '/index.dart';

class AppPreferences {
  final SharedPreferences _prefs;
  AppPreferences(this._prefs);

  Future<bool> get onSubmittedOnboarding async =>
      _prefs.setBool(Keys.onboarding, true);

  bool get getOnboarding => _prefs.getBool(Keys.onboarding) ?? false;

  // login
  Future<bool> get onSubmittedLogin async =>
      await _prefs.setBool(Keys.login, true);

  bool get isLogin => _prefs.getBool(Keys.login) ?? false;

  Future<bool> setToken(String token) async =>
      await _prefs.setString(Keys.token, "Bearer $token");

  String get getToken => _prefs.getString(Keys.token) ?? "";

  Future<bool> setLang(String code) async =>
      await _prefs.setString(Keys.languageCode, code);

  String get getLang => _prefs.getString(Keys.languageCode) ?? "en";

  Future<void> logout() async {
    await _prefs.remove(Keys.login);
    await _prefs.remove(Keys.token);
  }
}
