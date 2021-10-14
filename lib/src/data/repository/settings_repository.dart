// @dart=2.9
import 'dart:async';
import 'dart:convert';
import 'package:mvc_boilerplate/src/data/network/apis/setting_api.dart';
import 'package:mvc_boilerplate/src/data/sharedpref/constants/preferences.dart';
import 'package:mvc_boilerplate/src/data/sharedpref/shared_preference_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:location/location.dart';
import 'package:mvc_boilerplate/src/helpers/custom_trace.dart';
import 'package:mvc_boilerplate/src/models/address.dart';
import 'package:mvc_boilerplate/src/models/setting.dart';

ValueNotifier<Setting> setting = new ValueNotifier(new Setting());
ValueNotifier<Address> myAddress = new ValueNotifier(new Address());
//LocationData locationData;
class SettingsRepository {
  // api objects
  final SettingsApi _settingsApi;

  final navigatorKey = GlobalKey<NavigatorState>();
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  SettingsRepository(this._settingsApi, this._sharedPrefsHelper);

  Future<Setting> initSettings() async {
    Setting _setting;
    final String url =
        '${GlobalConfiguration().getValue('api_base_url')}settings';
    try {
      final response = await _settingsApi.initSettings();
        if (response != null) {
          _sharedPrefsHelper.setSettings(json.encode(response['data']));
          _setting = Setting.fromJSON(response['data']);
            _setting.mobileLanguage.value = Locale(_sharedPrefsHelper.getLanguage, '');
          _setting.brightness.value = _sharedPrefsHelper.isDarkMode ?? false
              ? Brightness.dark
              : Brightness.light;
          setting.value = _setting;
          // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
          setting.notifyListeners();
        }
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: url).toString());
      return Setting.fromJSON({});
    }
    return setting.value;
  }

  Future<dynamic> setCurrentLocation() async {
    var location = new Location();
    final whenDone = new Completer();
    Address _address = new Address();
    location.requestService().then((value) async {
      location.getLocation().then((_locationData) async {
        String _addressName = '';
        _address = Address.fromJSON({
          'address': _addressName,
          'latitude': _locationData?.latitude,
          'longitude': _locationData?.longitude
        });

        _sharedPrefsHelper.setAddress(json.encode(_address.toMap()));
        whenDone.complete(_address);
      }).timeout(Duration(seconds: 10), onTimeout: () async {
        _sharedPrefsHelper.setAddress(json.encode(_address.toMap()));
        whenDone.complete(_address);
        return null;
      }).catchError((e) {
        whenDone.complete(_address);
      });
    });
    return whenDone.future;
  }

  Future<Address> changeCurrentLocation(Address _address) async {
    if (!_address.isUnknown()) {
      _sharedPrefsHelper.setDeliveryAddress(json.encode(_address.toMap()));
    }
    return _address;
  }

  Future<Address> getCurrentLocation() async {
     myAddress.value =
          _sharedPrefsHelper.getAddress!=null?Address.fromJSON(json.decode(_sharedPrefsHelper.getAddress)):
    Address.fromJSON({});
      return myAddress.value;
  }

  void setBrightness(Brightness brightness) async {

    if (brightness == Brightness.dark) {
      _sharedPrefsHelper.setBrightness( true);
      brightness = Brightness.dark;
    } else {
      _sharedPrefsHelper.setBrightness( false);

      brightness = Brightness.light;
    }
  }

  Future<void> setDefaultLanguage(String language) async {
    if (language != null) {

      await _sharedPrefsHelper.setLanguage(language);
    }
  }

  Future<String> getDefaultLanguage(String defaultLanguage) async {
      defaultLanguage = _sharedPrefsHelper.getLanguage??await _sharedPrefsHelper.getLanguage;
    return defaultLanguage;
  }

  Future<void> saveMessageId(String messageId) async {
    if (messageId != null) {

      await _sharedPrefsHelper.setMessageId(messageId);
    }
  }

  Future<String> getMessageId() async {

    return await _sharedPrefsHelper.getMessageId;
  }
}

