// @dart=2.9
import 'dart:convert';
import 'dart:io';

import 'package:mvc_boilerplate/src/data/network/apis/main_api.dart';
import 'package:mvc_boilerplate/src/data/sharedpref/shared_preference_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mvc_boilerplate/src/helpers/custom_trace.dart';
import 'package:mvc_boilerplate/src/helpers/helper.dart';
import 'package:mvc_boilerplate/src/models/address.dart';
import 'package:mvc_boilerplate/src/models/filter.dart';
import 'package:mvc_boilerplate/src/models/main_data.dart';
import 'package:mvc_boilerplate/src/models/review.dart';
import 'package:mvc_boilerplate/src/models/user.dart';
import 'package:mvc_boilerplate/src/data/repository/user_repository.dart' as userRepo;

class MainDataRepository {

  // api objects
  final MainApi _mainApi;

  final navigatorKey = GlobalKey<NavigatorState>();
  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  MainDataRepository(this._mainApi, this._sharedPrefsHelper);

  Future<Stream<MainData>> getListMainData() async {
    User _user = userRepo.currentUser.value;
    Uri uri = Helper.getUri('api/manager/restaurants');
    if (_user.apiToken == null) {
      return new Stream.value(new MainData.fromJSON({}));
    }
    try {
      final streamedMainData = await _mainApi.getListMainData(_user);
      return streamedMainData((data) => Helper.getData(data)).expand((data) => (data as List)).map((data) {
        return MainData.fromJSON(data);
      });
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
      return new Stream.value(new MainData.fromJSON({}));
    }
  }

  Future<Stream<MainData>> searchMainData(String search) async {
    Uri uri = Helper.getUri('api/restaurants');
    Map<String, dynamic> _queryParams = {};
    _queryParams['search'] = 'name:$search;description:$search';
    _queryParams['searchFields'] = 'name:like;description:like';
    _queryParams['limit'] = '5';
    uri = uri.replace(queryParameters: _queryParams);
    try {
      final streamedMainData = await _mainApi.searchMainData(search);
      return streamedMainData((data) => Helper.getData(data)).expand((data) => (data as List)).map((data) {
        return MainData.fromJSON(data);
      });
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
      return new Stream.value(new MainData.fromJSON({}));
    }
  }

  Future<Stream<MainData>> getMainData(String id) async {
    Uri uri = Helper.getUri('api/restaurants/$id');
    try {
      final streamedRest = await _mainApi.getMainData(id);
      return streamedRest.stream.transform(utf8.decoder).transform(json.decoder).map((data) => Helper.getData(data)).map((data) => MainData.fromJSON(data));
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
      return new Stream.value(new MainData.fromJSON({}));
    }
  }

  Future<Stream<Review>> getMainDataReviews(String id) async {
    Uri uri = Helper.getUri('api/restaurant_reviews');
    try {
      final streamedRest = await _mainApi.getMainDataReviews(id);
      return streamedRest.stream.transform(utf8.decoder).transform(json.decoder).map((data) => Helper.getData(data)).expand((data) => (data as List)).map((data) {
        return Review.fromJSON(data);
      });
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
      return new Stream.value(new Review.fromJSON({}));
    }
  }

  Future<Stream<Review>> getRecentReviews() async {
    final String url = '${GlobalConfiguration().getValue('api_base_url')}restaurant_reviews?orderBy=updated_at&sortedBy=desc&limit=3&with=user';
    try {
      final streamedRest = await _mainApi.getRecentReviews();
      return streamedRest.stream.transform(utf8.decoder).transform(json.decoder).map((data) => Helper.getData(data)).expand((data) => (data as List)).map((data) {
        return Review.fromJSON(data);
      });
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: url).toString());
      return new Stream.value(new Review.fromJSON({}));
    }
  }

  Future<Review> addMainDataReview(Review review, MainData mainData) async {
    final String url = '${GlobalConfiguration().getValue('api_base_url')}restaurant_reviews';
    review.user = userRepo.currentUser.value;
    try {
      final response = await _mainApi.addMainDataReview(review,mainData);
      if (response.statusCode == 200) {
        return Review.fromJSON(json.decode(response.body)['data']);
      } else {
        print(CustomTrace(StackTrace.current, message: response.body).toString());
        return Review.fromJSON({});
      }
    } catch (e) {
      print(CustomTrace(StackTrace.current, message: url).toString());
      return Review.fromJSON({});
    }
  }
}
