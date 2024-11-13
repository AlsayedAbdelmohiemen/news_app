import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/models/articles_model.dart';
import 'package:news_app/models/sources_model.dart';

class ApiManger {
  static Future<SourcesModel> fetchSources(String category) async {
    var quary = {
      "apiKey": Constants.apikey,
      "category": category,
    };
    final response = await http.get(
      Uri.https(
        Constants.baseurl,
        "/v2/top-headlines/sources",
        quary,
      ),
    );
    var sourceDate = SourcesModel.fromjson(jsonDecode(response.body));
    debugPrint(response.body);
    if (response.statusCode == 200 &&
        jsonDecode(response.body)["status"] == "ok") {
      return sourceDate;
    } else {
      throw Exception("Failed to Load sources");
    }
  }

  static Future<ArticlModel> fetchNewsList(String source) async {
    var quary = {
      "apiKey": Constants.apikey,
      "sources": source,
    };
    var uri = Uri.https(Constants.baseurl, "/v2/everything", quary);

    final response = await http.get(uri);
    if (response.statusCode == 200 &&
        jsonDecode(response.body)["status"] == "ok") {
      var articles = ArticlModel.fromJson(jsonDecode(response.body));
      return articles;
    }else{
      throw Exception("Failed to Load articles");
    }
  }
}
