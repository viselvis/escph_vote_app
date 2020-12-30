import 'package:flutter/material.dart';

// Widget for tab items being displayed in the bottom app bar in Main page
class TabItem extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isSelected;
  final Function onTap;

  const TabItem({Key key, this.text, this.icon, this.isSelected, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(icon, color: isSelected ? Colors.white : Colors.grey),
            Text(text,
                style: TextStyle(
                    color: isSelected ? Colors.white : Colors.grey,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal))
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}
