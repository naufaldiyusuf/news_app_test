import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:news_app_test/service/news_api_service.dart';

import '../model/models.dart';

class Controller extends GetxController {
  List<NewsApiArticles> articles = <NewsApiArticles>[].obs;
  RxBool loading = true.obs;

  getNews(String country, String category) async {
    loading.value = true;
    articles.clear();
    update();
    await NewsApiService.getNews(country, category).then((value) {
      if (value.status == "ok") {
        loading.value = false;
        value.articles.forEach((e) {
          articles.add(e);
        });
        update();
      }
    });
  }
}