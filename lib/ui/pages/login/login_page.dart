import 'dart:async';
import 'package:escph_vote_app/assets/theme/theme_values.dart';
import 'package:escph_vote_app/constants/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:escph_vote_app/ui/pages/customwidgets/custom_widgets.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:escph_vote_app/constants/constants.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String initMsg = "This is the login page!";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;

  // Navigate to another route
  void _navigate(String route) {
    // Navigator.of(context).pushNamed('/');
    Navigator.of(context).pushNamed(route).then((value) {
      //This makes sure the textfield is cleared after page is pushed.
      _emailController.clear();
      _passwordController.clear();
    });;
  }

  // Attempt to go inside the app
  void _goToMain() async {
    if (_formKey.currentState.validate()) {
      try {
        final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        )).user;
        
        if (user != null) {
          setState(() {
            _success = true;
            _userEmail = user.email;
          });
          _setLogin();
          // Go to the main Activity
          _navigate(main);
        } else {
          setState(() {
            _success = false;
          });
          _displayToast("Your account is not yet registered in the app.");
        }
      } catch(loginError) {
        if(loginError is PlatformException) {
          _displayToast(loginError.message);
        }
      }
    }
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
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default font family.
        fontFamily: 'Quicksand',
      ),
      // onGenerateRoute: MyRouter.generateRoute,
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
                // put here the two TextFields?
                customTxtFormField2(_emailController, "Email", 0),
                SizedBox(
                  height: 10,
                ),
                customTxtFormField2(_passwordController, "Password", 1),

                SizedBox(
                  height: 10,
                ),

                // customButton("Login", Icons.login, _navigateToMain(main))
                // Navigator.pushNamed(context, route);
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
                            "LOGIN",
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
                      _goToMain();
                    }),
                SizedBox(
                  height: 30,
                ),
                customButton("REGISTER", _navigate, register, 2)
              ],
            ),
                    ))),
          ),
        ),
      ),
    );
  }

  _setLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLoggedIn, true);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
