import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:mvc_boilerplate/src/data/network/dio_client.dart';
import 'package:mvc_boilerplate/src/data/network/rest_client.dart';
import 'package:mvc_boilerplate/src/helpers/custom_trace.dart';
import 'package:mvc_boilerplate/src/helpers/helper.dart';
import 'package:mvc_boilerplate/src/models/main_data.dart';
import 'package:mvc_boilerplate/src/models/review.dart';
import 'package:mvc_boilerplate/src/models/user.dart';
import 'package:global_configuration/global_configuration.dart';

class MainApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  MainApi(this._dioClient, this._restClient);

  Future<dynamic> getListMainData(User user) async {
    Uri uri = Helper.getUri('api/manager/restaurants');
    Map<String, dynamic> _queryParams = {};

    _queryParams['api_token'] = user.apiToken;
    _queryParams['orderBy'] = 'id';
    _queryParams['sortedBy'] = 'desc';
    uri = uri.replace(queryParameters: _queryParams);
    try {
      return await _restClient.getStreameData(uri);
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
      throw e;
    }
  }

  Future<dynamic> searchMainData(String search) async {
    Uri uri = Helper.getUri('api/restaurants');
    Map<String, dynamic> _queryParams = {};
    _queryParams['search'] = 'name:$search;description:$search';
    _queryParams['searchFields'] = 'name:like;description:like';
    _queryParams['limit'] = '5';
    uri = uri.replace(queryParameters: _queryParams);
    try {
      return await _restClient.getStreameData(uri);
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
      throw e;
    }
  }
  Future<dynamic> getMainData(String id) async {
    Uri uri = Helper.getUri('api/restaurants/$id');
    Map<String, dynamic> _queryParams = {};
    _queryParams['with'] = 'users';
    uri = uri.replace(queryParameters: _queryParams);
    try {
      return await _restClient.getStreameData(uri);
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
      throw e;
    }
  }

  Future<dynamic> getMainDataReviews(String id) async {
    Uri uri = Helper.getUri('api/restaurant_reviews');
    Map<String, dynamic> _queryParams = {};
    _queryParams['with'] = 'user';
    _queryParams['search'] = 'restaurant_id:$id';
    _queryParams['limit'] = '5';
    uri = uri.replace(queryParameters: _queryParams);
    try {
      return await _restClient.getStreameData(uri);
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
      throw e;
    }
  }

  Future<dynamic> getRecentReviews() async {
    final String url = '${GlobalConfiguration().getValue('api_base_url')}restaurant_reviews?orderBy=updated_at&sortedBy=desc&limit=3&with=user';
    try {
      return await _restClient.getStreameData(url);
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: url.toString()).toString());
      throw e;
    }
  }

  Future<dynamic> addMainDataReview(Review review, MainData mainData) async {
    final String url = '${GlobalConfiguration().getValue('api_base_url')}restaurant_reviews';
    try {

      return await _restClient.postClient(url,body:json.encode(review.ofMainDataToMap(mainData)),headers:{HttpHeaders.contentTypeHeader: 'application/json'} );
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: url).toString());
      throw e;
    }
  }

}
