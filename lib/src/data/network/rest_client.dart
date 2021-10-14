// @dart=2.9
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:mvc_boilerplate/src/data/network/constants/endpoints.dart';
import 'package:mvc_boilerplate/src/helpers/custom_trace.dart';
import 'package:mvc_boilerplate/src/helpers/helper.dart';
import 'package:http/http.dart' as http;

import 'exceptions/network_exceptions.dart';

class RestClient {
  // instantiate json decoder for json serialization
  final JsonDecoder _decoder = JsonDecoder();

  // Get:-----------------------------------------------------------------------
  Future<dynamic> get(String path,{headers}) async{
    final res = await http.get(Uri.https(Endpoints.baseUrl, path),headers:headers );
    return res.body;
  }

  Future<dynamic> getStreameData(uri)async {
    final http.Client client = new http.Client();
    final streamedRest = await client.send(http.Request('get', uri));
    return streamedRest;
  }
  // Post:----------------------------------------------------------------------
  Future<dynamic> post(String path,
      {Map<String, String> headers, body, encoding}) {
    return http
        .post(
          Uri.https(Endpoints.baseUrl, path),
          body: body,
          headers: headers,
          encoding: encoding,
        )
        .then(_createResponse);
  }

  Future<dynamic> postClient(String url,
      {Map<String, String> headers, body}) async{
    final client = new http.Client();
    final response = await client.post(
      Uri.parse(url),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      body: json.encode(body),
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      print(CustomTrace(StackTrace.current, message: response.body).toString());
      throw new Exception(response.body);
    }
  }

  // Put:----------------------------------------------------------------------
  Future<dynamic> put(String path,
      {Map<String, String> headers, body, encoding}) {
    return http
        .put(
          Uri.https(Endpoints.baseUrl, path),
          body: body,
          headers: headers,
          encoding: encoding,
        )
        .then(_createResponse);
  }

  // Delete:----------------------------------------------------------------------
  Future<dynamic> delete(String path,
      {Map<String, String> headers, body, encoding}) {
    return http
        .delete(
          Uri.https(Endpoints.baseUrl, path),
          body: body,
          headers: headers,
          encoding: encoding,
        )
        .then(_createResponse);
  }

  // Response:------------------------------------------------------------------
  dynamic _createResponse(http.Response response) {
    final String res = response.body;
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400) {
      throw NetworkException(
          message: 'Error fetching src/data from server', statusCode: statusCode);
    }

    return _decoder.convert(res);
  }
}
