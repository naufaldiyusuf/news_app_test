import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    _timer = Timer(Duration(seconds: 2), () {

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
        child: SizedBox(
          height: 86,
          width: 229,
          child: Column(
            children: [
              Icon(Icons.newspaper, color: Colors.white),
              Text("News App", style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      ),
    );
  }
}