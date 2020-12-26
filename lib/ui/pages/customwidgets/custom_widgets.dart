import 'dart:async';
import 'package:flutter/material.dart';

typedef VoidNavigate = void Function(String route);

// returns a FlatButton with characteristics depending on the params
FlatButton customButton(String title, IconData icon, VoidNavigate onCustomButtonPressed, String route) {
  return new FlatButton(
    shape: new RoundedRectangleBorder(
        borderRadius: new BorderRadius.circular(25.0)),
    // in the future, color will be dependent on the params as well
    color: Colors.deepOrange,
    child: new Container(
      height: 50.0,
      width: 120.0,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: new Icon(
              icon,
              color: Colors.white70,
              size: 30.0,
            ),
          ),
          new Text(
            title,
            style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.w300),
          ),
        ],
      ),
    ),
    onPressed: (){
      // ignore: unnecessary_statements
      onCustomButtonPressed(route);
    }
  );
}