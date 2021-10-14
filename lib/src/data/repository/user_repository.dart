// @dart=2.9
import 'dart:convert';
import 'dart:io';
import 'package:mvc_boilerplate/src/data/network/apis/user_api.dart';
import 'package:mvc_boilerplate/src/data/sharedpref/constants/preferences.dart';
import 'package:mvc_boilerplate/src/data/sharedpref/shared_preference_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import 'package:mvc_boilerplate/src/helpers/custom_trace.dart';
import 'package:mvc_boilerplate/src/helpers/helper.dart';
import 'package:mvc_boilerplate/src/models/address.dart';
import 'package:mvc_boilerplate/src/models/credit_card.dart';
import 'package:mvc_boilerplate/src/models/user.dart';
import 'package:mvc_boilerplate/src/data/repository/user_repository.dart' as userRepo;

import 'constants/config_constants.dart';

ValueNotifier<User> currentUser = new ValueNotifier(User());
ValueNotifier<int> userDataPorgress = new ValueNotifier(0);

class UserRepository {
  // api objects
  final UserApi _userApi;
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  UserRepository(this._userApi, this._sharedPrefsHelper);

  Future<User> login(User user) async {
    final response = await _userApi.login(user);
    if (response.statusCode == 200) {
      setCurrentUser(response.body);
      currentUser.value = User.fromJSON(json.decode(response.body)['data']);
    } else {
      print(CustomTrace(StackTrace.current, message: response.body).toString());
      throw new Exception(response.body);
    }
    return currentUser.value;
  }

  Future<User> register(User user) async {
    final response = await _userApi.register(user);
    if (response.statusCode == 200) {
      setCurrentUser(response.body);
      currentUser.value = User.fromJSON(json.decode(response.body)['data']);
    } else {
      print(CustomTrace(StackTrace.current, message: response.body).toString());
      throw new Exception(response.body);
    }
    return currentUser.value;
  }

  Future<bool> resetPassword(User user) async {
    final done = await _userApi.resetPassword(user);
      return done;
  }

  Future<void> logout() async {
    currentUser.value = new User();
    await _sharedPrefsHelper.removeCurrentUser();
  }

  void setCurrentUser(jsonString) async {
    try {
      if (json.decode(jsonString)['data'] != null) {
        _sharedPrefsHelper.setCurrentUser(json.encode(json.decode(jsonString)['data']));
/*        await prefs.setString(
            'current_user', json.encode(json.decode(jsonString)['data']));*/
      }
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: jsonString).toString());
      throw new Exception(e);
    }
  }

  Future<void> setCreditCard(CreditCard creditCard) async {
    if (creditCard != null) {
      _sharedPrefsHelper.setCreditCard(json.encode(creditCard.toMap()));
     // await prefs.setString('credit_card', json.encode(creditCard.toMap()));
    }
  }

  Future<User> getCurrentUser() async {

    //prefs.clear();
    if (currentUser.value.auth == null && _sharedPrefsHelper.containsKey(Preferences.currentUser)) {
      currentUser.value =
          User.fromJSON(json.decode(_sharedPrefsHelper.getCurrentUser));
      currentUser.value.auth = true;
    } else {
      currentUser.value.auth = false;
    }
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    currentUser.notifyListeners();
    return currentUser.value;
  }

  Future<CreditCard> getCreditCard() async {
    CreditCard _creditCard = new CreditCard();

      _creditCard =
          _sharedPrefsHelper.getCreditCard??CreditCard.fromJSON(json.decode(_sharedPrefsHelper.getCreditCard));

    return _creditCard;
  }

  Future<User> update(User user) async {
       final response =await _userApi.update(user, currentUser.value.id, currentUser.value.apiToken);
    setCurrentUser(response.body);
    currentUser.value = User.fromJSON(json.decode(response.body)['data']);
    return currentUser.value;
  }

  Future<Stream<Address>> getAddresses() async {
    User _user = currentUser.value;
    final String _apiToken = 'api_token=${_user.apiToken}&';
    final String url =
        '${GlobalConfiguration().getValue(ConfigConstants.apiBaseUrl)}delivery_addresses?$_apiToken&search=user_id:${_user.id}&searchFields=user_id:=&orderBy=is_default&sortedBy=desc';
    try {
      final client = new http.Client();
      final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

      return streamedRest.stream
          .transform(utf8.decoder)
          .transform(json.decoder)
          .map((data) => Helper.getData(data))
          .expand((data) => (data as List))
          .map((data) {
        return Address.fromJSON(data);
      });
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: url));
      return new Stream.value(new Address.fromJSON({}));
    }
  }

  Future<Address> addAddress(Address address) async {
    User _user = userRepo.currentUser.value;
    final String _apiToken = 'api_token=${_user.apiToken}';
    address.userId = _user.id;
    final String url =
        '${GlobalConfiguration().getValue(ConfigConstants.apiBaseUrl)}delivery_addresses?$_apiToken';
    final client = new http.Client();
    try {
      final response = await client.post(
        Uri.parse(url),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: json.encode(address.toMap()),
      );
      return Address.fromJSON(json.decode(response.body)['data']);
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: url));
      return new Address.fromJSON({});
    }
  }

  Future<Address> updateAddress(Address address) async {
    User _user = userRepo.currentUser.value;
    final String _apiToken = 'api_token=${_user.apiToken}';
    address.userId = _user.id;
    final String url =
        '${GlobalConfiguration().getValue(ConfigConstants.apiBaseUrl)}delivery_addresses/${address.id}?$_apiToken';
    final client = new http.Client();
    try {
      final response = await client.put(
        Uri.parse(url),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
        body: json.encode(address.toMap()),
      );
      return Address.fromJSON(json.decode(response.body)['data']);
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: url));
      return new Address.fromJSON({});
    }
  }

  Future<Address> removeDeliveryAddress(Address address) async {
    User _user = userRepo.currentUser.value;
    final String _apiToken = 'api_token=${_user.apiToken}';
    final String url =
        '${GlobalConfiguration().getValue(ConfigConstants.apiBaseUrl)}delivery_addresses/${address.id}?$_apiToken';
    final client = new http.Client();
    try {
      final response = await client.delete(
        Uri.parse(url),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      return Address.fromJSON(json.decode(response.body)['data']);
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: url));
      return new Address.fromJSON({});
    }
  }

  Future<Stream<User>> getDriversOfRestaurant(String restaurantId) async {
    Uri uri =
    Helper.getUri('api/manager/users/drivers_of_restaurant/$restaurantId');
    Map<String, dynamic> _queryParams = {};
    User _user = userRepo.currentUser.value;

    _queryParams['api_token'] = _user.apiToken;
    uri = uri.replace(queryParameters: _queryParams);

    try {
      final client = new http.Client();
      final streamedRest = await client.send(http.Request('get', uri));

      return streamedRest.stream
          .transform(utf8.decoder)
          .transform(json.decoder)
          .map((data) => Helper.getData(data))
          .expand((data) => (data as List))
          .map((data) {
        return User.fromJSON(data);
      });
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
      return new Stream.value(User.fromJSON({}));
    }
  }

}