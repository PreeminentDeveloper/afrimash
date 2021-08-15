import 'dart:convert';

import 'package:afrimash/service/get_logged_in_details_service.dart';
import 'package:afrimash/service/network_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginService {
  NetworkHandler networkHandler = NetworkHandler();
  SharedPreferences prefs;
  String jwt;
  GetLoggedInDetailsService getLoggedInDetailsService =
      GetLoggedInDetailsService();

  loginUser(Map<String, dynamic> data) async {
    prefs = await SharedPreferences.getInstance();
    var response =
        await networkHandler.postWithoutToken("/afrimash/authenticate", data);
    final Map<String, dynamic> decodedData = jsonDecode(response.body);
    try {
      if (response.statusCode == 200 || response.statusCode == 201) {
        prefs.setString("token", decodedData['jwt']);
        await getLoggedInDetailsService.loggedInDetails();
        return {'success': true, 'message': decodedData};
      } else {
        return {'success': false, 'message': decodedData['errorMsg']};
      }
    } catch (e) {
      print(e.toString());
      return {'success': false, 'message': decodedData};
    }
  }
}
