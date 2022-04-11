import 'dart:convert';
import 'dart:developer';

import 'package:flutter_news_app/network/api/api_utils.dart';
import 'package:flutter_news_app/network/api_helper/api_constants.dart';
import 'package:flutter_news_app/network/api_responses/breaking_news_response.dart';
import 'package:flutter_news_app/utils/helpers.dart';

class BreakingNewsService {
  static Future<List<Articles>> getNews() async {
    if (await Helper.isNetworkAvailable()) {
      String apiUrl = breakingNewsPath;

      var apiResponse = await ApiUtils.getRequest(apiUrl);
      log(jsonEncode(apiResponse));

      BreakingNewsResponse breakingNewsResponse =
          BreakingNewsResponse.fromJson(apiResponse);

      if (breakingNewsResponse.status == 'ok') {
        return breakingNewsResponse.articles;
      } else {
        return [];
      }
    } else {
      return [];
    }
  }
}
