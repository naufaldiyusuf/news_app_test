import 'package:dio/dio.dart';
import 'package:news_app_test/helper/constant.dart';

import '../model/models.dart';

class NewsApiService {
  static Future<NewsApiModel> getNews(String country, String category) async {
    try {
      String baseUrl = Constant.baseUrl;
      String apiKey = Constant.apiKey;

      var dio = Dio();

      final response = await dio.get(
        baseUrl,
        queryParameters: {
          "country": country,
          "category": category
        },
        options: Options(
          headers: {
            "X-Api-Key": apiKey
          }
        )
      );

      return NewsApiModel.fromJson(response.data);
    } catch (e) {
      return NewsApiModel.withError(e.toString());
    }
  }
}