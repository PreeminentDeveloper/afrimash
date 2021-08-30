import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sbutton extends StatelessWidget {
  String title;
  Widget icon;
  Function onPressed;
  Sbutton({this.title, this.icon, this.onPressed});

  Widget build(BuildContext context) {
    return CupertinoButton(
      color: Color(0xfff1c40f),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? Container(),
          Text(title, style: TextStyle(color: Colors.black)),
        ],
      ),
      onPressed: onPressed,
    );
  }
}
