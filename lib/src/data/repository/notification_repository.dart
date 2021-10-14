// @dart=2.9
import 'dart:convert';
import 'dart:io';

import 'package:mvc_boilerplate/src/data/network/apis/notification_api.dart';
import 'package:mvc_boilerplate/src/data/sharedpref/shared_preference_helper.dart';
import 'package:mvc_boilerplate/src/helpers/custom_trace.dart';
import 'package:mvc_boilerplate/src/helpers/helper.dart';
import 'package:mvc_boilerplate/src/models/notification.dart';
import 'package:mvc_boilerplate/src/models/user.dart';
import 'package:mvc_boilerplate/src/data/repository/user_repository.dart' as userRepo;

class NotificationRepository {
  // api objects
  final NotificationApi _notificationApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  NotificationRepository(this._notificationApi, this._sharedPrefsHelper);
  Future<Stream<Notification>> getNotifications() async {
    Uri uri = Helper.getUri('api/notifications');
    Map<String, dynamic> _queryParams = {};
    User _user = userRepo.currentUser.value;
    if (_user.apiToken == null) {
      return new Stream.value(Notification.fromJSON({}));
    }
    _queryParams['api_token'] = _user.apiToken;
    _queryParams['search'] = 'notifiable_id:${_user.id}';
    _queryParams['searchFields'] = 'notifiable_id:=';
    _queryParams['orderBy'] = 'created_at';
    _queryParams['sortedBy'] = 'desc';
    _queryParams['limit'] = '10';
    uri = uri.replace(queryParameters: _queryParams);
    try {
      final streamedRest = await _notificationApi.getNotifications(_user);
      return streamedRest.stream
          .transform(utf8.decoder)
          .transform(json.decoder)
          .map((data) => Helper.getData(data))
          .expand((data) => (data as List))
          .map((data) {
        return Notification.fromJSON(data);
      });
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
      return new Stream.value(new Notification.fromJSON({}));
    }
  }

  Future<Notification> markAsReadNotifications(Notification notification) async {
    User _user = userRepo.currentUser.value;
    if (_user.apiToken == null) {
      return new Notification();
    }
    final response =await _notificationApi.markAsReadNotifications(notification,_user.apiToken);
    return Notification.fromJSON(json.decode(response)['data']);
  }

  Future<Notification> removeNotification(Notification cart) async {
    User _user = userRepo.currentUser.value;
    if (_user.apiToken == null) {
      return new Notification();
    }
    final response = await _notificationApi.removeNotification(cart,_user.apiToken);
    return Notification.fromJSON(json.decode(response)['data']);
  }

  Future<void> sendNotification(String body, String title, User user) async {
    await _notificationApi.sendNotification( body,  title,  user,
        user.deviceToken);
  }
}
