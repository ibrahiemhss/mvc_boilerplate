import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:mvc_boilerplate/src/data/network/constants/endpoints.dart';
import 'package:mvc_boilerplate/src/data/network/dio_client.dart';
import 'package:mvc_boilerplate/src/data/network/rest_client.dart';
import 'package:mvc_boilerplate/src/helpers/custom_trace.dart';
import 'package:mvc_boilerplate/src/models/setting.dart';
import 'package:mvc_boilerplate/src/models/user.dart';
import 'package:global_configuration/global_configuration.dart';

class SettingsApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  SettingsApi(this._dioClient, this._restClient);

  Future<dynamic> login(User user) async {
    final String url = '${GlobalConfiguration().getValue('api_base_url')}login';
    final response=await _restClient.postClient(url,body:user.toMap());
    if (response != null) {
      return response;
    } else {
      print(CustomTrace(StackTrace.current, message: response).toString());
      throw new Exception(response.body);
    }
  }

  Future<dynamic> register(User user) async {
    final String url =
        '${GlobalConfiguration().getValue('api_base_url')}register';
    final response=await _restClient.postClient(url,body:user.toMap());
    if (response != null) {
      return response;
    } else {
      print(CustomTrace(StackTrace.current, message: response).toString());
      throw new Exception(response.body);
    }
  }

  Future<dynamic> initSettings() async {
    final String url =
        '${GlobalConfiguration().getValue('api_base_url')}settings';
    try {
      final response = await _dioClient
          .get( url);
      if (response!=null) {
          return response;
      } else {
        print(CustomTrace(StackTrace.current, message: response.body).toString());
        return Setting.fromJSON({});
      }
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: url).toString());
      return Setting.fromJSON({});
    }
  }
}
