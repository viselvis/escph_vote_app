import 'package:escph_vote_app/ui/pages/login/register.dart';
import 'package:flutter/material.dart';
import 'package:escph_vote_app/constants/constants.dart';
import 'package:escph_vote_app/ui/pages/login/login_page.dart';
import 'package:escph_vote_app/ui/pages/main/main_page.dart';

class MyRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case main:
        return MaterialPageRoute(builder: (_) => MainPage());
      case register:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                  child: Text('No route defined for ${settings.name}')),
            )
        );
    }

  }
}