import 'dart:async';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String initMsg = "This is the login page!";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
          child: Text(initMsg),
        )
    );
  }
}
