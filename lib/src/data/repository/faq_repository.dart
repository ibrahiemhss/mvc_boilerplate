// @dart=2.9
import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:http/http.dart' as http;

import 'package:mvc_boilerplate/src/helpers/helper.dart';
import 'package:mvc_boilerplate/src/models/faq_category.dart';
import 'package:mvc_boilerplate/src/models/user.dart';
import 'package:mvc_boilerplate/src/data/repository/user_repository.dart';

Future<Stream<FaqCategory>> getFaqCategories() async {
  User _user = currentUser.value;
  final String _apiToken = 'api_token=${_user.apiToken}&';
  final String url =
      '${GlobalConfiguration().getValue('api_base_url')}faq_categories?${_apiToken}with=faqs';

  final client = new http.Client();
  final streamedRest = await client.send(http.Request('get', Uri.parse(url)));

  return streamedRest.stream
      .transform(utf8.decoder)
      .transform(json.decoder)
      .map((data) => Helper.getData(data))
      .expand((data) => (data as List))
      .map((data) {
    return FaqCategory.fromJSON(data);
  });
}
