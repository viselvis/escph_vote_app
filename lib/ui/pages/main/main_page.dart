import 'dart:async';
import 'package:flutter/material.dart';
import 'package:escph_vote_app/ui/pages/customwidgets/tab_item.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

final tabs = ['News', 'Other Stuff'];

class _MainPageState extends State<MainPage> {
  int selectedPosition = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.where_to_vote),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavBar(),
      body: Center(child: Text("This is main")),
    );
  }

  _buildBottomNavBar() {
    return BottomAppBar(
      color: Colors.lightGreen,
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
}


