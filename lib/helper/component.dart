import 'dart:async';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:news_app_test/screen/news_detail_screen.dart';

import '../controller/controller.dart';

Widget customListTile(String title, String image, String source, BuildContext context, String description, String content) {
  return InkWell(
    onTap: () {
      Get.to(() => NewsDetailScreen(title, image, source, description, content));
    },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              //let's add the height

              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              source,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          )
        ],
      ),
    ),
  );
}

Widget formSearchNewsList(
    TextEditingController textController,
    Controller getController,
    String country,
    String category,
    Timer? debounce
    ) {
  return Padding(
    padding: const EdgeInsets.only(top: 16, right: 18, left: 18),
    child: SizedBox(
      height: 47,
      child: TextFormField(
        textInputAction: TextInputAction.search,
        controller: textController,
        onChanged: (value) {
          if (debounce?.isActive ?? false) debounce?.cancel();
          debounce = Timer(Duration(milliseconds: 500), () {
            getController.getNews(country, category, value);
          });
        },
        decoration: InputDecoration(
          //hintTextDirection: ,

          contentPadding: EdgeInsets.all(10.0),
          suffixIcon: Icon(Icons.search),
          hintText: "Search your keyword here",
          fillColor: const Color(0xffEBECEC),
          errorStyle: const TextStyle(color: Colors.red),
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(8.0)),
        ),
      ),
    ),
  );
}

Widget dataEmpty() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.newspaper, color: Colors.black, size: 150,),
      Text("Tidak ada data", style: TextStyle(color: Colors.black, fontSize: 30))
    ],
  );
}

Widget dataError() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.error, color: Colors.red, size: 150,),
      Text("Terjadi kesalahan", style: TextStyle(color: Colors.black, fontSize: 30))
    ],
  );
}