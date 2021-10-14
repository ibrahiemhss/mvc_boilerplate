import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:mvc_boilerplate/src/data/network/constants/endpoints.dart';
import 'package:mvc_boilerplate/src/data/network/dio_client.dart';
import 'package:mvc_boilerplate/src/data/network/rest_client.dart';
import 'package:mvc_boilerplate/src/helpers/custom_trace.dart';
import 'package:mvc_boilerplate/src/helpers/helper.dart';
import 'package:mvc_boilerplate/src/models/notification.dart';
import 'package:mvc_boilerplate/src/models/setting.dart';
import 'package:mvc_boilerplate/src/models/user.dart';
import 'package:global_configuration/global_configuration.dart';

class NotificationApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  NotificationApi(this._dioClient, this._restClient);

  Future<dynamic> login(User user) async {
    final String url = '${GlobalConfiguration().getValue('api_base_url')}login';
    final response = await _restClient.postClient(url, body: user.toMap());
    if (response != null) {
      return response;
    } else {
      print(CustomTrace(StackTrace.current, message: response).toString());
      throw new Exception(response.body);
    }
  }

  Future<dynamic> getNotifications(User user) async {
    Uri uri = Helper.getUri('api/notifications');
    Map<String, dynamic> _queryParams = {};
    _queryParams['api_token'] = user.apiToken;
    _queryParams['search'] = 'notifiable_id:${user.id}';
    _queryParams['searchFields'] = 'notifiable_id:=';
    _queryParams['orderBy'] = 'created_at';
    _queryParams['sortedBy'] = 'desc';
    _queryParams['limit'] = '10';
    uri = uri.replace(queryParameters: _queryParams);
    try {
      final streamedRest = await _restClient.getStreameData(uri);
      return streamedRest;
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
    }
  }
  Future<dynamic> markAsReadNotifications(Notification notification,
      _apiToken) async {
    final String url =
        '${GlobalConfiguration().getValue(
        'api_base_url')}notifications/${notification.id}?$_apiToken';
    final response = await _restClient.put(
      url,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode(notification.markReadMap()),
    );
    print(
        "[${response
            .statusCode}] NotificationRepository markAsReadNotifications");
    return response;
  }

  Future<dynamic> removeNotification(Notification cart,apiToken) async {

    final String _apiToken = 'api_token=${apiToken}';
    final String url =
        '${GlobalConfiguration().getValue('api_base_url')}notifications/${cart.id}?$_apiToken';

    final response = await _restClient.delete(
      url,
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    print("[${response.statusCode}] NotificationRepository removeCart");
    return response;
  }

  Future<void> sendNotification(String body, String title, User user,
      fcmKey) async {
    final data = {
      "notification": {"body": "$body", "title": "$title"},
      "priority": "high",
      "data": {
        "click_action": "FLUTTER_NOTIFICATION_CLICK",
        "id": "messages",
        "status": "done"
      },
      "to": "${user.deviceToken}"
    };
    final String url = 'https://fcm.googleapis.com/fcm/send';
    final response = await _restClient.post(
      url,
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.authorizationHeader: "key=${fcmKey}",
      },
      body: json.encode(data),
    );
    if (response.statusCode != 200) {
      print('notification sending failed');
    }
  }
}