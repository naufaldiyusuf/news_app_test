import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app_test/screen/tab_bar/news_list_screen.dart';

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
        automaticallyImplyLeading: false,
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
          NewsListScreen("id", ""),
          NewsListScreen("us", ""),
          NewsListScreen("id", "business"),
          NewsListScreen("id", "technology")
        ],
      ),
    );
  }
}
