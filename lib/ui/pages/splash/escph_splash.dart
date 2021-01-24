import 'dart:async';
import 'dart:io';
import 'package:escph_vote_app/ui/pages/main/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:escph_vote_app/ui/pages/login/login_page.dart';
import 'package:escph_vote_app/assets/theme/theme_values.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:escph_vote_app/constants/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences sharedPreferences;
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

  // This is where you navigate
  void navigationPage() async {
    sharedPreferences = await SharedPreferences.getInstance();
    bool status = sharedPreferences.getBool(isLoggedIn);

    if (status == null) {
      status = false;
      // set initial value
      sharedPreferences?.setBool(isLoggedIn, false);
    } else {
      if (status) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => MainPage()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: bgGradient,
        child: Align(
            alignment: Alignment.center,
            child: Image.asset(
              "lib/assets/images/escph_app_temp.png",
              width: 200,
              height: 200,
            )),
      ),
    );
  }
}
