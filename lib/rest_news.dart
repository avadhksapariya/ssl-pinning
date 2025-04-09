import 'dart:convert';
import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:ssl_pinning/model_news.dart';

class RESTNews {
  RESTNews(this.client);

  final http.Client client;
  final newsAPIKey = dotenv.get("KEY");

  Future<ModelNews?> getArticles() async {
    const String tag = "get_news_api";
    ModelNews? data;

    final url = Uri.parse("https://newsapi.org/v2/everything?q=react&apiKey=$newsAPIKey");
    log("$tag URL: GET $url");

    try {
      final response = await client.get(url);
      log("$tag response: ${response.body}");

      final decodedData = json.decode(response.body);
      data = ModelNews.fromJson(decodedData);

      return data;
    } catch (e) {
      log("$tag error: ${e.toString()}");
      return null;
    }
  }
}
