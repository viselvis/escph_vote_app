import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:escph_vote_app/ui/pages/customwidgets/tab_item.dart';
import 'package:escph_vote_app/assets/theme/theme_values.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:escph_vote_app/constants/constants.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

final tabs = ['News', 'Other Stuff'];

class _MainPageState extends State<MainPage> {
  int selectedPosition = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Define the default font family.
        fontFamily: 'Quicksand',
      ),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.where_to_vote),
          backgroundColor: bluePrimary,
          focusColor: blueLight,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _buildBottomNavBar(),
        body: Container(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(
                    "There's nothing much here yet, but we will have lots of content soon! Stay tuned!",
                    style: new TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 20,
                  ),
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
                              "LOGOUT",
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
                        _logOut();
                      }),
                ])),
          ),
        )),
      ),
    );
  }

  _buildBottomNavBar() {
    return BottomAppBar(
      color: goldPrimary,
      shape: CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 3,
            child: TabItem(
              text: tabs[0],
              icon: Icons.fiber_new_sharp,
              isSelected: selectedPosition == 0,
              onTap: () {
                setState(() {
                  selectedPosition = 0;
                });
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: SizedBox(
              width: 40,
            ),
          ),
          Expanded(
            flex: 3,
            child: TabItem(
              text: tabs[1],
              icon: Icons.wallet_giftcard,
              isSelected: selectedPosition == 1,
              onTap: () {
                setState(() {
                  selectedPosition = 1;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  void _logOut() async {
    final FirebaseUser user = await _auth.currentUser();
    if (user == null) {
      _displayToast('No one has signed in.');
      return;
    }
    await _auth.signOut();
    final String uid = user.uid;
    _logOutSharedPrefs();
    _displayToast(uid + ' has successfully signed out.');
    Navigator.pop(context);
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

  _logOutSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isLoggedIn, false);
  }
}
