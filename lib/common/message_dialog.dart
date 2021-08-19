import 'package:flutter/material.dart';

Future messageDialog(String content, BuildContext context, Function onPressed) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Message"),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              child: Text('OK', style: TextStyle(color: Colors.red)),
              onPressed: onPressed,
            ),
          ],
        );
      });
}
