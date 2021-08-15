import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SmartChatSetting {
  static Map awesomeIcon = {
    'whatsapp': FontAwesomeIcons.whatsapp,
    'phone': FontAwesomeIcons.phone,
    'sms': FontAwesomeIcons.sms,
    'google': FontAwesomeIcons.google,
    'facebookMessenger': FontAwesomeIcons.facebookMessenger,
  };
  static List<Map> listChatDefault = [
    {'app': 'https://wa.me/849908854', 'iconData': 'whatsapp'},
    {'app': 'tel:8499999999', 'iconData': 'phone'},
    {'app': 'sms://8499999999', 'iconData': 'sms'},
    {'app': 'firebase', 'iconData': 'google'},
    {
      'app': 'https://tawk.to/chat/5e5cab81a89cda5a1888d472/default',
      'iconData': 'facebookMessenger'
    }
  ];

  static String adminEmailDefault = 'admininspireui@gmail.com';
  static String adminNameDefault = 'InspireUI';
}
