import 'dart:async';
import 'package:escph_vote_app/constants/constants.dart';
import 'package:escph_vote_app/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:escph_vote_app/ui/pages/customwidgets/custom_widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String initMsg = "This is the login page!";

  void _navigateToMain(String route) {
    // Navigator.of(context).pushNamed('/');
    Navigator.of(context).pushNamed(route);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // onGenerateRoute: MyRouter.generateRoute,
      home: Scaffold(
        body: SafeArea(
            child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              initMsg,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            // customButton("Login", Icons.login, _navigateToMain(main))
            // Navigator.pushNamed(context, route);
            customButton("Login", Icons.login, _navigateToMain, main)
          ],
        ))),
      ),
    );
  }
}
