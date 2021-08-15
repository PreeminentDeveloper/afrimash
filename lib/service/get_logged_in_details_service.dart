import 'dart:convert';

import 'package:afrimash/model/get_logged_in_details.dart';
import 'package:afrimash/service/network_handler.dart';
import 'package:flutter/cupertino.dart';

class GetLoggedInDetailsService with ChangeNotifier {
  NetworkHandler networkHandler = NetworkHandler();
  String jwt;
  GetLoggedInDetails _getLoggedInDetails = GetLoggedInDetails();

  GetLoggedInDetails get getLoggedInDetails {
    print("Getter: ${_getLoggedInDetails.object.user.username}");
    return _getLoggedInDetails;
  }

  loggedInDetails() async {
    var response = await networkHandler
        .getWithToken("/afrimash/customers/logged-in-details");
    try {
      if (response['status'] == "OK") {
        print("Logged In Details Response: $response");
        _getLoggedInDetails = GetLoggedInDetails.fromJson(response);
        notifyListeners();
        print("Getter 2: ${_getLoggedInDetails.object.user.username}");
        print("Getter 3: ${getLoggedInDetails.object.user.username}");
        print("check");
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
