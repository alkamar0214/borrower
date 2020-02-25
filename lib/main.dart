import 'package:flutter/material.dart';
import 'package:lab_sls/sharedloginregister.dart';
import 'package:lab_sls/splash.dart';
import 'package:lab_sls/borrower.dart';
import 'package:lab_sls/slider.dart';

// import 'package:lab_sls/validation.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/slider': (BuildContext context) => new Home(),
        '/sharedloginregister': (BuildContext context) => new Login(),
        '/sharedloginregister': (BuildContext context) => new Register(),
        // '/validation': (BuildContext context) => new MyHomePage(),
        '/borrowers': (BuildContext context) => new TransfterData(),

        // '/myhomepage.dart': (BuildContext context) => new MyHomePage(),
      },
      home: SplashScreen(),
    );
  }
}
