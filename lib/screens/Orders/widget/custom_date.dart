import 'package:flutter/material.dart';

class CustomDate extends StatelessWidget {
  final String textHint;
  final String errorText;
  final Function onTap;
  final Color hintColor;
  final Color textColor;
  final Icon icon;

  CustomDate(
      {this.textHint,
      this.errorText,
      this.onTap,
      this.hintColor,
      this.textColor,
      this.icon});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: onTap,
          child: Container(
            child: InputDecorator(
              decoration: InputDecoration(
                  errorText: errorText,
                  // isDense: true,
                  // contentPadding:
                  //     EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                  border: OutlineInputBorder(),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(textHint,
                      style: TextStyle(color: hintColor, fontSize: 14)),
                  icon,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
