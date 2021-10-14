import 'dart:async';
import 'dart:convert';

import 'package:mvc_boilerplate/src/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constants/preferences.dart';

class SharedPreferenceHelper {
  // shared pref instance
  final SharedPreferences _sharedPreference;

  // constructor
  SharedPreferenceHelper(this._sharedPreference);

  //----------------------------------------------------------------------------
  // General Methods: ----------------------------------------------------------
  //----------------------------------------------------------------------------
  bool containsKey(String key)  {
    return _sharedPreference.containsKey(key);
  }
  Future<String?> get authToken async {
    return _sharedPreference.getString(Preferences.authToken);
  }

  Future<bool> saveAuthToken(String authToken) async {
    return _sharedPreference.setString(Preferences.authToken, authToken);
  }

  Future<bool> removeAuthToken() async {
    return _sharedPreference.remove(Preferences.authToken);
  }

  //----------------------------------------------------------------------------
  // UserRepository:------------------------------------------------------------
  //----------------------------------------------------------------------------
  Future<bool> get isLoggedIn async {
    return _sharedPreference.getBool(Preferences.isLoggedIn) ?? false;
  }

  Future<bool> saveIsLoggedIn(bool value) async {
    return _sharedPreference.setBool(Preferences.isLoggedIn, value);
  }
  void removeCurrentUser() {
    _sharedPreference.remove(Preferences.currentUser);
  }
  void setCurrentUser(String value) {
    _sharedPreference.setString(Preferences.currentUser, value);
  }
  String? get getCurrentUser {
    if(containsKey(Preferences.currentUser)){
      return  _sharedPreference.getString(Preferences.currentUser);
    }else{
      return null;
    }
  }

  void setCreditCard(String value) {
    _sharedPreference.setString(Preferences.creditCard, value);
  }
  String? get getCreditCard {
    if(containsKey(Preferences.creditCard)){
      return  _sharedPreference.getString(Preferences.creditCard);
    }else{
      return null;
    }
  }

  void removeCreditCard() {
    _sharedPreference.remove(Preferences.creditCard);
  }

  //----------------------------------------------------------------------------
  // SettingsRepository:--------------------------------------------------------
  //----------------------------------------------------------------------------
  void setSettings(String value) {
    _sharedPreference.setString(Preferences.settings, value);
  }
  String? get getSettings {
    if(containsKey(Preferences.settings)){
      return  _sharedPreference.getString(Preferences.settings);
    }else{
      return null;
    }
  }

  void removeSettings() {
    _sharedPreference.remove(Preferences.settings);
  }

  bool get isDarkMode {

    return containsKey(Preferences.isDarkMode)?_sharedPreference.getBool(Preferences.isDarkMode)! : false;
  }

  Future<void> setBrightness(bool value) {
    return _sharedPreference.setBool(Preferences.isDarkMode, value);
  }
  String? get getLanguage {
    return containsKey(Preferences.currentLanguage)?_sharedPreference.getString(Preferences.currentLanguage)! : "en";

  }

  Future<void> setLanguage(String language) {
    return _sharedPreference.setString(Preferences.currentLanguage, language);
  }

  String? get getMessageId {
    return containsKey(Preferences.googleMessageId)?_sharedPreference.getString(Preferences.googleMessageId)! : null;
  }

  Future<void> setMessageId(String val) {
    return _sharedPreference.setString(Preferences.googleMessageId, val);
  }
  void removeMessageId() {
    _sharedPreference.remove(Preferences.googleMessageId);
  }
  String? get getAddress {
    return containsKey(Preferences.myAddress)?_sharedPreference.getString(Preferences.myAddress)! : null;
  }

  Future<void> setAddress(String val) {
    return _sharedPreference.setString(Preferences.myAddress, val);
  }
  String? get getDeliveryAddress {
    return containsKey(Preferences.deliveryAddress)?_sharedPreference.getString(Preferences.deliveryAddress)! : null;
  }

  Future<void> setDeliveryAddress(String val) {
    return _sharedPreference.setString(Preferences.deliveryAddress, val);
  }
  //----------------------------------------------------------------------------
  //SearchRepository :----------------------------------------------------------
  //----------------------------------------------------------------------------
  String? get getRecentSearch {
    return containsKey(Preferences.recentSearch)?_sharedPreference.getString(Preferences.recentSearch)! : null;
  }

  Future<void> setRecentSearch(String val) {
    return _sharedPreference.setString(Preferences.recentSearch, val);
  }
  void removeRecentSearch() {
    _sharedPreference.remove(Preferences.recentSearch);
  }

  // user data info: -----------------------------------------------------------------
  void saveUserData(Map<dynamic, dynamic> value) {
    _sharedPreference.setString(Preferences.userData, json.encode(value));
  }

  User getUserData() {
    //print("test values from usermodel =${_sharedPreference.getString(Preferences.userData)}");

    if (_sharedPreference.getString(Preferences.userData) != null) {
      return User.fromJSON(json.decode(
              _sharedPreference.getString(Preferences.userData) ?? "") ??
          "");
    } else {
      return User();
    }
  }

  void changeIsFirstEntry(bool value) {
    _sharedPreference.setBool(Preferences.isFirstEntry, value);
  }

  @override
  bool get isFirstEntry {
    return _sharedPreference.getBool(Preferences.isFirstEntry) ?? true;
  }

  // UserType: -----------------------------------------------------------------
  void setUserType(int value) {
    print("=====user type is ===$value========");
    _sharedPreference.setInt(Preferences.userType, value);
  }

  int get userType {
    return _sharedPreference.getInt(Preferences.userType) ?? 0;
  }

  void saveFcmToken(String authToken) {
    _sharedPreference.setString(Preferences.fcmToken, authToken);
  }

  // Save Firebase messaging token: -----------------------------------------------------------------

  void removeFcmToken() {
    _sharedPreference.remove(Preferences.fcmToken);
  }
}
