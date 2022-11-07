import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

import 'tab_bar_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  // For handling notification when the app is in terminated state

  @override
  void initState() {
    // getInitialLink().then((value) {
    //   print("link");
    //   print(value!.substring(30, 33));
    //   print(value);
    // });

    _timer = Timer(Duration(seconds: 2), () {
      Get.to(() => TabBarPage());
    });

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.newspaper, color: Colors.white, size: 150,),
            Text("News Feed", style: TextStyle(color: Colors.white, fontSize: 30))
          ],
        ),
      ),
    );
  }
}