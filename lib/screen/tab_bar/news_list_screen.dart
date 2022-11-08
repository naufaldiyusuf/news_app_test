import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../controller/controller.dart';
import '../../helper/component.dart';
import '../../model/models.dart';

class NewsListScreen extends StatefulWidget {
  final String country;
  final String category;

  NewsListScreen(this.country, this.category);

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  List<NewsApiArticles> articles = [];
  bool isLoading = true;
  final Controller getController = Get.put(Controller());
  ScrollController scrollController = ScrollController();
  TextEditingController textController = TextEditingController();
  Timer? debounce;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      getController.getNews(widget.country, widget.category, "");
    });

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getController.getNextPage(widget.country, widget.category);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      init: Controller(),
      builder: (getController) {
        return getController.loading.isFalse ? Column(
          children: [
            formSearchNewsList(textController, getController, widget.country, widget.category, debounce),
            Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height * 0.7,
              child: getController.error.isTrue
                  ? dataEmpty()
                  :
              ( getController.articles.isEmpty
                  ? dataEmpty()
                  : ListView(
                  controller: scrollController,
                  children: getController.articles.map((e) {
                    return customListTile(e.title ?? "", e.urlImage ?? "", e.sourceName, context, e.description ?? "", e.content ?? "");
                  }).toList())
              ),
            ),
            getController.loadingNext.isTrue
                ? Center(
              child: Container(
                height: MediaQuery.of(context).size.width * 0.05,
                width: MediaQuery.of(context).size.width * 0.05,
                child: CircularProgressIndicator(),
              ),
            )
                : Container()
          ],
        ) : Center(
          child: CircularProgressIndicator(),
        );
    });
  }
}
