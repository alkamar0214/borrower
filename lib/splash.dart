import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lab_sls/sharedloginregister.dart';
import 'package:lab_sls/loader_animator.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    
    super.initState();
    Timer(Duration(seconds: 6),()=>Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
      return Login();
    })));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Image.asset('assets/uz-lab-logo.png'),
        SizedBox(height: 40.0,),
        // Image.asset('uz-lab-logo.png',width: 50.0,),
        Loading(
          radius: 15.0,
          dotRadius: 6.0,
        )
      ],),
    );
  }
}