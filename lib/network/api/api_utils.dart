import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter_news_app/network/api_helper/api_constants.dart';
import 'package:flutter_news_app/network/api_helper/api_exception.dart';
import 'package:http/http.dart' as http;

class ApiUtils {
  static Future<Map<String, dynamic>> getRequest(String apiUrl) async {
    try {
      //Remote Call to API with url and headers
      http.Response apiResponse = await http.get(_apiPath(apiUrl));

      //Checking for the response code and handling the result.
      return _returnResponse(apiResponse);
    }

    //Handling the condition when socket exception received.
    on SocketException {
      throw FetchDataException('Failure Occurred');
    }
  }

  static Future<Map<String, dynamic>> getRequestWithHeaders(
      String apiUrl) async {
    try {
      //Remote Call to API with url and headers
      http.Response apiResponse =
          await http.get(_apiPath(apiUrl), headers: await _headers());

      //Checking for the response code and handling the result.
      return _returnResponse(apiResponse);
    }

    //Handling the condition when socket exception received.
    on SocketException {
      throw FetchDataException('Failure Occurred');
    }
  }

  static Uri _apiPath(String url) {
    //Parsing the apiURl to Uri
    Uri uri = Uri.parse(baseUrl + url);
    log('API URL :: $uri');
    return uri;
  }

  static Future<Map<String, String>> _headers() async {
    //Getting auth token
    String apiKey = newsApiKey;
    log("API Key: $apiKey");
    //Creating http headers for api
    Map<String, String> headers = {
      'Authorization': apiKey,
      'Content-Type': 'application/json'
    };
    return headers;
  }

  ///Function to handle the response as per status code from api server
  static dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = jsonDecode(response.body);
        // Helper.printJSONData(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnAuthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
