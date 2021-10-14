import 'dart:async';

import 'package:mvc_boilerplate/src/data/network/constants/endpoints.dart';
import 'package:mvc_boilerplate/src/data/network/dio_client.dart';
import 'package:mvc_boilerplate/src/data/network/rest_client.dart';
import 'package:mvc_boilerplate/src/helpers/custom_trace.dart';
import 'package:mvc_boilerplate/src/models/user.dart';
import 'package:global_configuration/global_configuration.dart';

class UserApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  UserApi(this._dioClient, this._restClient);

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

  Future<bool> resetPassword(User user) async {
    final String url =
        '${GlobalConfiguration().getValue('api_base_url')}send_reset_link_email';
    final response=await _restClient.postClient(url,body:user.toMap());
    if (response != null) {
      return true;
    } else {
      print(CustomTrace(StackTrace.current, message: response).toString());
      throw new Exception(response.body);
    }
  }

  Future<dynamic> update(User user,userId,api_token) async {
    final String _apiToken = 'api_token=${api_token}';
    final String url =
        '${GlobalConfiguration().getValue('api_base_url')}users/${userId}?$_apiToken';
    final response=await _restClient.postClient(url,body:user.toMap());
    if (response != null) {
      return response;
    } else {
      print(CustomTrace(StackTrace.current, message: response).toString());
      throw new Exception(response.body);
    }
  }
}
