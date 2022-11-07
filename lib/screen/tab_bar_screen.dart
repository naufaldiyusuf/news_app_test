import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app_test/screen/tab_bar/national_news.dart';

import '../controller/controller.dart';

class TabBarPage extends StatefulWidget {
  const TabBarPage({Key? key}) : super(key: key);

  @override
  State<TabBarPage> createState() => _TabBarPageState();
}

class _TabBarPageState extends State<TabBarPage> with TickerProviderStateMixin {
  late TabController controller;
  final Controller getController = Get.put(Controller());

  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //create appBar
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Home"),
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(text: "Nasional"),
            Tab(text: "Internasional",),
            Tab(text: "Bisnis"),
            Tab(text: "Teknologi")
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          NewsListScreen("id", "", getController),
          NewsListScreen("us", "", getController),
          NewsListScreen("id", "business", getController),
          NewsListScreen("id", "technology", getController)
        ],
      ),
    );
  }
}
