import 'dart:async';
import 'package:flutter/material.dart';
import 'package:escph_vote_app/ui/pages/login/login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  final String initMsg = "This is the splash screen!";
  final splashDelay = 5;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadWidget();
  }

  // This is where you load the main widget
  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  // This is where you navigate ???
  void navigationPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(initMsg),
      ),
    );
  }
}
