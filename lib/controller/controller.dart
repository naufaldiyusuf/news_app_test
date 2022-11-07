import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:news_app_test/service/news_api_service.dart';

import '../model/models.dart';

class Controller extends GetxController {
  List<NewsApiArticles> articles = <NewsApiArticles>[].obs;
  RxBool loading = true.obs;
  RxBool loadingNext = false.obs;
  RxBool nextPageProses = false.obs;
  RxInt pageNow = 1.obs;
  RxString keyWordSave = "".obs;

  getNews(String country, String category, String keyWord) async {
    loading.value = true;
    articles.clear();
    keyWordSave.value = keyWord;
    pageNow.value = 1;
    update();
    await NewsApiService.getNews(country, category, pageNow.toInt(), keyWord).then((value) {
      if (value.status == "ok") {
        loading.value = false;
        pageNow.value += 1;
        value.articles.forEach((e) {
          articles.add(e);
        });
        update();
      }
    });
  }

  getNextPage(String country, String category) async {
    if (loadingNext.isFalse) {
      loadingNext.value = true;
      update();
      await NewsApiService.getNews(country, category, pageNow.toInt(), keyWordSave.toString()).then((value) {
        loadingNext.value = false;
        if (value.status == "ok") {
          loading.value = false;
          pageNow.value += 1;
          value.articles.forEach((e) {
            articles.add(e);
          });
          update();
        }
      });
    }
  }
}