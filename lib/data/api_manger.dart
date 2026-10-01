import 'dart:convert';
import 'dart:io';
// import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:news_app/core/api/result_api.dart';
import 'package:news_app/data/news_model.dart';

class ApiManager {
  static Future<ResultApi<NewsModel>> getNews() async {
    try {
      Uri url = Uri.https("newsapi.org", "/v2/everything", {
        "q": "bitcoin",
        "apiKey": "fe3889024c19498da3a6be826bf2ea59",
      });
      var response = await http.get(url);
      if (response.statusCode >= 200 && response.statusCode < 300) {
        var responseString = response.body;
        var json = jsonDecode(responseString);
        return Success(NewsModel.fromJson(json));
      } else {
        return Error("Error From server");
      }
    } on SocketException {
      return Error("Error From internet. try again...");
    } catch (e) {
      return Error("Error $e");
    }
  }
}
