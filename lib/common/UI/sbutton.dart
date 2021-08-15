import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sbutton extends StatelessWidget {
  String title;
  Function onPressed;
  Sbutton({this.title, this.onPressed});

  Widget build(BuildContext context) {
    return CupertinoButton(
      color: Color(0xfff1c40f),
      child: Text(title, style: TextStyle(color: Colors.black)),
      onPressed: onPressed,
    );
  }
}
