import 'dart:async';
import 'package:flutter/material.dart';
import 'package:escph_vote_app/assets/theme/theme_values.dart';

typedef VoidNavigate = void Function(String route);

// returns a FlatButton with characteristics depending on the params
FlatButton customButton(
    String title, VoidNavigate onCustomButtonPressed, String route, int type) {
  return new FlatButton(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0)),
      // in the future, color will be dependent on the params as well
      color: (type == 1) ? bluePrimary : goldPrimary,
      child: new Container(
        height: 50.0,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(right: 10.0),
            ),
            new Text(
              title,
              style: new TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        // ignore: unnecessary_statements
        onCustomButtonPressed(route);
      });
}

TextField customTextField(String hintText, int type) {
  return new TextField(
    obscureText: (type == 1) ? true : false,
    decoration: new InputDecoration(
      contentPadding:  EdgeInsets.only(right: 15.0, left: 15.0),
        border: new OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        hintStyle: new TextStyle(
          color: Colors.grey,
          fontSize: 16.0,
          fontStyle: FontStyle.italic
        ),
        hintText: hintText,
        fillColor: Colors.white
    ),
  );
}

TextFormField customTextFormField(TextEditingController controller, String hintText, int type){
  return new TextFormField(
      obscureText: (type == 1) ? true : false,
    controller: controller,
    decoration: new InputDecoration(
        contentPadding:  EdgeInsets.only(right: 15.0, left: 15.0),
        border: new OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
        filled: true,
        hintStyle: new TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
            fontStyle: FontStyle.italic
        ),
        hintText: hintText,
        fillColor: Colors.white
    ),
    validator: (String value) {
      if (value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    }
  );
}

FlatButton customButtonMultiRoute(
    String title, VoidNavigate onCustomButtonPressed, String route, int type) {
  return new FlatButton(
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(25.0)),
      // in the future, color will be dependent on the params as well
      color: (type == 1) ? bluePrimary : goldPrimary,
      child: new Container(
        height: 50.0,
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Padding(
              padding: EdgeInsets.only(right: 10.0),
            ),
            new Text(
              title,
              style: new TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      onPressed: () {
        // ignore: unnecessary_statements
        onCustomButtonPressed(route);
      });
}

TextFormField customTxtFormField2(TextEditingController controller, String hintText, int type){
  return new TextFormField(
      obscureText: (type == 1) ? true : false,
      controller: controller,
      decoration: new InputDecoration(
          contentPadding:  EdgeInsets.only(right: 15.0, left: 15.0),
          border: new OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.0),
            borderSide: BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          hintStyle: new TextStyle(
              color: Colors.grey,
              fontSize: 16.0,
              fontStyle: FontStyle.italic
          ),
          hintText: hintText,
          fillColor: Colors.white
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      }
  );
}



