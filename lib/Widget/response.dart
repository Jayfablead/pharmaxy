import 'dart:convert';


import 'package:ecommerce/Widget/CustomExpection.dart';
import 'package:ecommerce/Widget/sharedpreferance.dart';
import 'package:http/http.dart' as http;

responses(http.Response response) {
  switch (response.statusCode) {
    case 200:
      {
        if (jsonDecode(response.body)['statusCode'] == 101) {
          SaveDataLocal.clearUserData();
        }
        return response;
      }
    case 400:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occurred while Communication with Server with StatusCode :${response.statusCode}');
  }
}
