import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lab_sls/loader_animator.dart';
import 'package:lab_sls/slider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return Home();
            })));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset('assets/uz-lab-logo.png'),
          SizedBox(
            height: 40.0,
          ),
          // Image.asset('uz-lab-logo.png',width: 50.0,),
          Loading(
            radius: 15.0,
            dotRadius: 6.0,
          )
        ],
      ),
    );
  }
}
