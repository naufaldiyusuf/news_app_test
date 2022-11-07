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
  final Controller controller;

  NewsListScreen(this.country, this.category, this.controller);

  @override
  State<NewsListScreen> createState() => _NewsListScreenState();
}

class _NewsListScreenState extends State<NewsListScreen> {
  List<NewsApiArticles> articles = [];
  bool isLoading = true;
  final Controller getController = Get.put(Controller());

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      getController.getNews(widget.country, widget.category);


    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
      init: Controller(),
      builder: (getController) {
        return getController.loading.isFalse ? ListView(
          children: widget.controller.articles.map((e) {
            return customListTile(e.title ?? "", e.urlImage ?? "", e.sourceName, context);
          }).toList(),
        ) : Center(
          child: CircularProgressIndicator(),
        );
    });
  }
}
