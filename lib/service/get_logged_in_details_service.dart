import 'dart:convert';

import 'package:afrimash/model/get_logged_in_details.dart';
import 'package:afrimash/service/network_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetLoggedInDetailsService with ChangeNotifier {
  NetworkHandler networkHandler = NetworkHandler();
  String jwt;
  GetLoggedInDetails _getLoggedInDetails = GetLoggedInDetails();
  SharedPreferences prefs;

  GetLoggedInDetails get getLoggedInDetails => _getLoggedInDetails;

  loggedInDetails() async {
    prefs = await SharedPreferences.getInstance();
    var response = await networkHandler
        .getWithToken("/afrimash/customers/logged-in-details");
    try {
      if (response['status'] == "OK") {
        var activeUserEmail = response['object']['email'];
        var activeUserFirstName = response['object']['firstName'];
        var activeUserLastName = response['object']['lastName'];
        var activeUserPhoneNumber = response['object']['user']['phoneNo'];
        var activeUserState = response['object']['state'];
        var activeUserCity = response['object']['city'];
        print(
            "$activeUserLastName $activeUserFirstName $activeUserPhoneNumber $activeUserEmail $activeUserState $activeUserCity");
        prefs.setString("activeUserEmail", activeUserEmail);
        prefs.setString("activeUserFirstName", activeUserFirstName);
        prefs.setString("activeUserLastName", activeUserLastName);
        prefs.setString("activeUserPhoneNumber", activeUserPhoneNumber);
        prefs.setString("activeUserState", activeUserState);
        prefs.setString("activeUserCity", activeUserCity);
        print("Logged In Details Response: $response");
        _getLoggedInDetails = GetLoggedInDetails.fromJson(response);
        notifyListeners();
        return {'success': true, 'message': response};
      } else {
        return {'success': false, 'message': response['error']};
      }
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': response};
    }
  }
}
