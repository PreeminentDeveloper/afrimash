import 'package:afrimash/common/message_dialog.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void customLaunch(command, BuildContext context) async {
  if (await canLaunch(command)) {
    await launch(command);
  } else {
    throw messageDialog(
        "URL cannot be opened", context, () => Navigator.pop(context));
  }
}
