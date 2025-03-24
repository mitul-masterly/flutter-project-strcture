import 'dart:convert';

import 'package:flutter_project_structure/data/models/response_model/auth/user_data_model.dart';
import 'package:flutter_project_structure/helper/pref_helper/pref_keys.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static final SharedPreferenceHelper _instance =
      SharedPreferenceHelper._internal();

  factory SharedPreferenceHelper() => _instance;

  late SharedPreferences _sharedPreference;

  SharedPreferenceHelper._internal();

  /// Initialize SharedPreferences (Call this once in main)
  Future<void> init() async {
    _sharedPreference = await SharedPreferences.getInstance();
  }

  // General Methods: ----------------------------------------------------------
  Future<void> saveIsRememberMe(final bool isRememberMe) async {
    await _sharedPreference.setBool(PrefKeys.isRememberMe, isRememberMe);
  }

  bool? get isRememberMe {
    return _sharedPreference.getBool(PrefKeys.isRememberMe);
  }

  Future<void> saveUser(final UserDataModel user) async {
    await _sharedPreference.setString(PrefKeys.user, jsonEncode(user.toJson()));
  }

  UserDataModel? get user {
    final String? userPref = _sharedPreference.getString(PrefKeys.user);
    if (userPref != null && userPref.isNotEmpty) {
      return UserDataModel.fromJson(jsonDecode(userPref));
    }
    return null;
  }

  Future<void> saveFcmToken(final String fcmToken) async {
    await _sharedPreference.setString(PrefKeys.fcmToken, fcmToken);
  }

  String? get fcmToken {
    return _sharedPreference.getString(PrefKeys.fcmToken);
  }

  bool get isLoggedIn {
    return _sharedPreference.getBool(PrefKeys.isLoggedIn) ?? false;
  }

  String? get currentLanguage {
    return _sharedPreference.getString(PrefKeys.currentLanguage) ??
        SupportedLangCode.english.langCode;
  }

  Future<void> changeLanguage(final String language) async {
    await _sharedPreference.setString(PrefKeys.currentLanguage, language);
  }

  Future<void> setCountryCode(final String code) async {
    await _sharedPreference.setString(PrefKeys.countryCode, code);
  }

  String get getCountryCode {
    return _sharedPreference.getString(PrefKeys.countryCode) ??
        SupportedLangCode.english.countryCode;
  }

  Future<void> saveIsLoggedIn(final bool value) async {
    await _sharedPreference.setBool(PrefKeys.isLoggedIn, value);
  }

  Future<void> setRememberEmail(final String value) async {
    await _sharedPreference.setString(PrefKeys.rememberEmail, value);
  }

  String get getRememberEmail {
    return _sharedPreference.getString(PrefKeys.rememberEmail) ?? '';
  }

  Future<void> setUserPassword(final String value) async {
    await _sharedPreference.setString(PrefKeys.rememberPassword, value);
  }

  String get getSavedPassword {
    return _sharedPreference.getString(PrefKeys.rememberPassword) ?? '';
  }

  Future<void> clear() async {
    final List<String> arrKeysToKeep = <String>[
      PrefKeys.isRememberMe,
      PrefKeys.rememberEmail,
      PrefKeys.rememberPassword,
      PrefKeys.languageCode,
      PrefKeys.currentLanguage
    ];

    final Set<String>? keys = _sharedPreference.getKeys();
    if (keys != null) {
      for (String key in keys.toList()) {
        if (!arrKeysToKeep.contains(key)) {
          _sharedPreference.remove(key);
        }
      }
    }
  }

  //Language Code
  Future<void> setLanguageCode(final String value) async {
    await _sharedPreference.setString(PrefKeys.languageCode, value);
  }

  String get getLanguageCode {
    return _sharedPreference.getString(PrefKeys.languageCode) ?? 'en';
  }

  void putString(final String key, final String value) async {
    _sharedPreference.setString(key, value);
  }

  void putInt(final String key, final int value) async {
    _sharedPreference.setInt(key, value);
  }

  void putBoolean(final String key, final bool value) async {
    _sharedPreference.setBool(key, value);
  }

  Future<String> getString(final String key) async {
    return _sharedPreference.getString(key) ?? '';
  }

  Future<bool> removeString(final String key) async {
    return _sharedPreference.remove(key);
  }

  Future<int> getInt(final String key) async {
    return _sharedPreference.getInt(key) ?? 0;
  }

  Future<bool> getBoolean(final String key) async {
    return _sharedPreference.getBool(key) ?? false;
  }
}
