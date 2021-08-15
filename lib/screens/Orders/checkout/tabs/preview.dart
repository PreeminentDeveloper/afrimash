import 'package:flutter/material.dart';

class Preview extends StatefulWidget {
  final TabController tabController;
  const Preview({Key key, this.tabController}) : super(key: key);

  @override
  PreviewState createState() => PreviewState();
}

class PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Text("Preview")));
  }
}
