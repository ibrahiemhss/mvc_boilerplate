// @dart=2.9
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:mvc_boilerplate/src/helpers/custom_trace.dart';
import 'package:mvc_boilerplate/src/helpers/helper.dart';
import 'package:mvc_boilerplate/src/models/gallery.dart';
import 'package:mvc_boilerplate/src/models/user.dart';
import 'package:mvc_boilerplate/src/data/repository/user_repository.dart' as userRepo;

//Future<Stream<Gallery>> getGalleries(String idRestaurant) async {
//  User _user = currentUser.value;
//  final String _apiToken = 'api_token=${_user.apiToken}&';
//  final String url = '${GlobalConfiguration().getValue('api_base_url')}galleries?${_apiToken}search=restaurant_id:$idRestaurant';
//
//  final client = new http.Client();
//  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));
//
//  return streamedRest.stream
//      .transform(utf8.decoder)
//      .transform(json.decoder)
//      .map((data) => Helper.getData(data))
//      .expand((data) => (data as List))
//      .map((data) => Gallery.fromJSON(data));
//}

Future<Stream<Gallery>> getGalleries(String idRestaurant) async {
  Map<String, dynamic> _queryParams = {};
  User _user = userRepo.currentUser.value;
  Uri uri = Helper.getUri('api/galleries');
  _queryParams['api_token'] = _user.apiToken;
  _queryParams['search'] = 'restaurant_id:$idRestaurant';

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
      return Gallery.fromJSON(data);
    });
  } catch (e) {
    print(CustomTrace(StackTrace.current, message: uri.toString()).toString());
    return new Stream.value(new Gallery.fromJSON({}));
  }
}
