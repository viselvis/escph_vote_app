import 'dart:developer';

import 'package:escph_vote_app/ui/pages/customwidgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:escph_vote_app/assets/theme/theme_values.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // final variables
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordReenteredController =
      TextEditingController();
  bool _success;
  String _userEmail;

  TextFormField customTxtFormField(TextEditingController controller, String hintText, int type){
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

  // method for displaying toast message
  void _displayToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blueGrey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  // method for registering the user in the app
  void _register() async {
    if (_formKey.currentState.validate()) {
      if (_passwordReenteredController.text == _passwordController.text) {
        try {
          final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
              email: _emailController.text,
              password: _passwordController.text)
          ).user;

          String email = user.email;
          if (user != null) {
            _displayToast("Your account has been created successfully, redirecting you back to login page.");
            Navigator.pop(context);
          } else {
            _displayToast("Your account has not been created successfully. Please try again later.");
          }
        } catch(signUpError) {
          if(signUpError is PlatformException) {
           _displayToast(signUpError.message);
          }
        }
      } else {
        _displayToast("Make sure passwords are equal!");
      }


    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default font family.
        fontFamily: 'Quicksand',
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          decoration: bgGradient,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: SafeArea(
                child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo here
                Image.asset(
                  "lib/assets/images/escph_app_temp.png",
                  width: 200,
                  height: 200,
                ),

                SizedBox(
                  height: 20,
                ),

                customTxtFormField(_emailController, "Email address", 0),
                SizedBox(
                  height: 10,
                ),
                customTxtFormField(_usernameController, "Username", 0),
                SizedBox(
                  height: 10,
                ),
                customTxtFormField(_passwordController, "Password", 1),
                SizedBox(
                  height: 10,
                ),
                customTxtFormField(_passwordReenteredController, "Re-enter password", 1),
                SizedBox(
                  height: 30,
                ),
                // customButtonMultiRoute("REGISTER", _register, "none", 2)
                FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(25.0)),
                      // in the future, color will be dependent on the params as well
                      color: bluePrimary,
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
                              "REGISTER",
                              style: new TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      onPressed: () async {
                        _register();
                      }),
              ],
            ),
                    ))),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _passwordReenteredController.dispose();
    super.dispose();
  }
}
